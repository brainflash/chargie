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
	@State var selectedPack: ChargiePack?
	
	init() {
		UITableViewCell.appearance().backgroundColor = .clear
		UITableView.appearance().backgroundColor = .clear
		UITableView.appearance().separatorStyle = .none
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
