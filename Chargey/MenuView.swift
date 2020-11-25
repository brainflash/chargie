//
//  MenuView.swift
//  Chargie
//
//  Created by Brainflash on 25/11/2020.
//

import SwiftUI

struct MenuView: View {
	@EnvironmentObject private var model: AppModel
	
    var body: some View {
		ZStack {
			Color.black
				.edgesIgnoringSafeArea(.all)
			
			Text("Menu View")
				.foregroundColor(.red)
				.font(.headline)
				.bold()
		}
		.navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
