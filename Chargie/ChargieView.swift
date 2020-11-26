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
	
    var body: some View {
		let chargie = model.chargie

		ZStack {
			NavigationLink(destination: TestView(pack: .chargiePack1), isActive: $isShowingMainView) { EmptyView() }
//			NavigationLink(destination: MenuView(), isActive: $isShowingMainView) { EmptyView() }

			chargie.background
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				LottieView(chargie: chargie, name: $name, play: $play)
//					.frame(width: 300, height: 300)
				
				Text("App mode: \(model.appMode.rawValue)")
					.foregroundColor(.white)
					.font(.headline)
					.bold()
			}
		}
		.background(Color.blue)
		.onReceive(model.$appMode) { appMode in
			
			switch appMode {
			case .normal:
				self.play = false
				isShowingMainView = true
			case .charging:
//				self.chargie = model.charging
				self.name = model.chargingAnimation
				self.play = true
				isShowingMainView = false
			case .disconnected:
//				self.chargie = model.disconnected
				self.name = model.disconnectedAnimation
				self.play = true
				isShowingMainView = false
			}
		}
    }
}

struct ChargieView_Previews: PreviewProvider {
//	static var name = "36318-cat-preloader"
	static var name = "33534-merry-christmas"
	
    static var previews: some View {
		ChargieView(name: name)
    }
}
