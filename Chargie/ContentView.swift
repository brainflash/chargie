//
//  ContentView.swift
//  Chargie
//
//  Created by Brainflash on 24/11/2020.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject private var model: AppModel
	
	let animation = "36318-cat-preloader"

    var body: some View {
		NavigationView {
			
			ChargieView(name: animation)
			
		}
		.onReceive(model.$appMode) { appMode in
			// Animate navigation in normal mode
			let normalMode = (appMode == .normal)
			UINavigationBar.setAnimationsEnabled(normalMode)
		}
		.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
