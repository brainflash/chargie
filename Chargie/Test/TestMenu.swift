//
//  TestMenu.swift
//  Chargie
//
//  Created by Brainflash on 01/12/2020.
//

import SwiftUI

#warning("TestMenu is enabled")

struct TestMenu: View {
	@EnvironmentObject private var model: AppModel
	@State var selectedPack: ChargiePack?

	init() {
		UITableViewCell.appearance().backgroundColor = .clear
		UITableView.appearance().backgroundColor = .clear
		UITableView.appearance().separatorStyle = .none
	}
	
	var body: some View {
		VStack {
			HStack {
				
				List {
					ForEach(model.chargiePacks) { pack in
						PackRow(pack: pack, selectedPack: $selectedPack)
					}
				}
			}
			.background(Image("Backgrounds/bruno-thethe-Evp4iNF3DHQ-unsplash")
							.resizable()
							.edgesIgnoringSafeArea(.all)
							.scaledToFill())
			.preferredColorScheme(.dark)		// white status bar tint
			.navigationBarHidden(false)
			.navigationBarBackButtonHidden(true)
			.navigationTitle("Chargie")
			
			HStack {
				Spacer()
				
				Button("Sim Charging") {
					model.appMode = .charging
				}
				.foregroundColor(.white)
				.font(.headline)
				.padding()
				
				Spacer()
				
				Button("Sim Disconnected") {
					model.appMode = .disconnected
				}
				.padding()
				.font(.headline)
				.foregroundColor(.white)

				Spacer()
			}
		}
	}
}

struct TestMenu_Previews: PreviewProvider {
	static var previews: some View {
		TestMenu()
			.environmentObject(AppModel())
			.environmentObject(Store())
	}
}
