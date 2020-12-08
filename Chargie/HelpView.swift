//
//  HelpView.swift
//  Chargie
//
//  Created by Brainflash on 07/12/2020.
//

import SwiftUI

struct HelpView: View {
	@Environment(\.presentationMode) var presentation

	var body: some View {
		NavigationView {
			Group {
				Text("Help View")
			}
			.preferredColorScheme(.dark)		// white status bar tint
			.navigationBarItems(trailing:
				Button(action: { self.presentation.wrappedValue.dismiss() }) {
						Text("Done")
							.foregroundColor(.white)
					}
			)
			.navigationBarTitle(Text("Help"))
		}
	}
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
