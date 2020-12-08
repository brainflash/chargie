//
//  MenuView.swift
//  Chargie
//
//  Created by Brainflash on 25/11/2020.
//

import SwiftUI

struct MenuView: View {
	@EnvironmentObject private var model: AppModel
	@State var isShowingPreviewView = false
	@State var activeSheet: ActiveSheet?
	@State var selectedPack: ChargiePack?
	
	enum ActiveSheet: Identifiable {
		case settings, help
		
		var id: Int {
			hashValue
		}
	}
	
	init() {
		UITableViewCell.appearance().backgroundColor = .clear
		UITableView.appearance().backgroundColor = .clear
		UITableView.appearance().separatorStyle = .none
		UINavigationBar.appearance().tintColor = .white
	}
	
	var blurView: some View {
		#if os(iOS)
		return VisualEffectBlur(blurStyle: .systemThinMaterialLight)
		#else
		return VisualEffectBlur()
		#endif
	}
	
    var body: some View {
		VStack {
//			NavigationLink(destination: SettingsView(), isActive: $isShowingSettingsView) { EmptyView() }

			NavigationLink(destination: PreviewView(pack: selectedPack ?? .emptyPack, chargie: selectedPack?.selectedChargie), isActive: $isShowingPreviewView) { EmptyView() }
			
			List {
				ForEach(model.chargiePacks) { pack in
					PackRow(pack: pack, selectedPack: $selectedPack)
				}
			}
		}
		.onChange(of: selectedPack) { _ in
			isShowingPreviewView = true
		}
		.onAppear() {
			selectedPack = nil
		}
		.background(Image("Backgrounds/bruno-thethe-Evp4iNF3DHQ-unsplash")
						.resizable()
						.edgesIgnoringSafeArea(.all)
						.scaledToFill())
		.preferredColorScheme(.dark)		// white status bar tint
		.navigationBarItems(trailing:
			HStack {
				Button(action: { activeSheet = .help }) {
					HStack {
						Image(systemName: "book").imageScale(.large)
					}.frame(width: 40, height: 40)
				}
				.accessibility(label: Text("Help"))
				
				Button(action: { activeSheet = .settings }) {
					HStack {
						Image(systemName: "gear").imageScale(.large)
					}.frame(width: 40, height: 40)
				}
				.accessibility(label: Text("Settings"))
			}
		)
		.sheet(item: $activeSheet) { item in
			switch item {
			case .settings:
				SettingsView()
			case .help:
				HelpView()
			}
		}
		.navigationBarHidden(false)
		.navigationBarBackButtonHidden(true)
		.navigationTitle("Chargie")
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
			.environmentObject(AppModel())
			.environmentObject(Store())
    }
}
