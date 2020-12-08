//
//  SettingsView.swift
//  Chargie
//
//  Created by Brainflash on 07/12/2020.
//

import SwiftUI

struct SettingsView: View {
	@Environment(\.presentationMode) var presentation

//	init() {
//		UINavigationBar.appearance().tintColor = .white
//	}
	
    var body: some View {
		NavigationView {
			Group {
				Text("Settings View")
			}
			.preferredColorScheme(.dark)		// white status bar tint
			.navigationBarItems(trailing:
				Button(action: { self.presentation.wrappedValue.dismiss() }) {
						Text("Done")
							.foregroundColor(.white)
					}
			)
			.navigationBarTitle(Text("Settings"))
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


// Snippet showing how to change back button text
//
// Put this at the top:
//		@Environment(\.presentationMode) var presentation
//
//		.navigationBarBackButtonHidden(true)
//		.navigationBarItems(leading:
//			Button(action: { self.presentation.wrappedValue.dismiss() }) {
//					HStack {
//						Image(systemName: "chevron.left")
//						Text("Back")
//					}
//				}
//		)
