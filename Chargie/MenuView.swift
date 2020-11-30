//
//  MenuView.swift
//  Chargie
//
//  Created by Brainflash on 25/11/2020.
//

import SwiftUI

struct MenuView: View {
	@EnvironmentObject private var model: AppModel
	
	init() {
//		UITableView.appearance().separatorStyle = .none
		UITableViewCell.appearance().backgroundColor = .black
		UITableView.appearance().backgroundColor = .black
	}
	
    var body: some View {
		ZStack {
			Color.black
				.edgesIgnoringSafeArea(.all)
			
			List {
				ForEach(model.chargiePacks) { pack in
					PackRow(pack: pack)
				}
			}
			.listRowBackground(Color.black)
			
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
