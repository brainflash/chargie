//
//  ChargieView.swift
//  Chargie
//
//  Created by Brainflash on 25/11/2020.
//

import SwiftUI

struct ChargieView: View {
	@EnvironmentObject private var model: AppModel
	@State var isShowingMainView = false
	@State var name: String
	@State var play = false

//	let animation = "9678-colorfull-loading"
	let animation = "36318-cat-preloader"
	// TODO: arrange animation files into resource subfolders:
	// 			Resources/Animations/

    var body: some View {
		ZStack {
			NavigationLink(destination: MenuView(), isActive: $isShowingMainView) { EmptyView() }

			Color.black
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				LottieView(name: $name, play: $play)
					.frame(width: 300, height: 300)
				
				Text("App mode: \(model.appMode.rawValue)")
					.foregroundColor(.white)
					.font(.headline)
					.bold()
			}
		}
		.onReceive(model.$appMode) { appMode in
			
			switch appMode {
			case .normal:
				self.play = false
				isShowingMainView = true
			case .charging:
				self.name = model.chargingAnimation
				self.play = true
				isShowingMainView = false
			case .disconnected:
				self.name = model.disconnectedAnimation
				self.play = true
				isShowingMainView = false
			}
		}
    }
}

struct ChargieView_Previews: PreviewProvider {
	static var name = "36318-cat-preloader"

    static var previews: some View {
		ChargieView(name: name)
    }
}
