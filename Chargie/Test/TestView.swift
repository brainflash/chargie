//
//  TestView.swift
//  Chargie
//
//  Created by Brainflash on 25/11/2020.
//

import SwiftUI

#warning("TestView is enabled")

struct TestView: View {
	@EnvironmentObject private var model: AppModel
	@State var play = false
	@State var index = 0
	@State var background = Color.black
	
	let pack: ChargiePack
	
	let animations: [String] = [
		"13308-merry-christmas",
		"3602-christmas-pudding-slider",
		"6146-racing",
		"6728-cat",
		"8144-battery-low-humour-animation",
		"8175-catcoffee",
		"15392-charging-battery",
		"16307-progress",
		"30317-sunshine-rainbow-white-horse",
		"30874-battery-charging",
		"33534-merry-christmas",
		"37725-loading-50-among-us",
		"38699-appointment-notify",
		"38910-cat-escape",
		"39388-wolf-and-moon",
		"39500-santa-claus",
		"39715-build-a-snowman"
	]
	
	init(pack: ChargiePack) {
		self.pack = pack
	}
	
	var body: some View {
		
		ZStack {
			model.charging.background
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				LottieView(chargie: model.charging, play: $play)
//					.frame(width: 300, height: 300)

				HStack {
					Text("Index: \(index)")
						.font(.headline)
						.bold()
						.foregroundColor(.white)
						.padding()
					
					ColorPicker(selection: $model.charging.background, supportsOpacity: false, label: {
						Label {
						} icon: {
						}
						.labelStyle(IconOnlyLabelStyle())
					})
					.padding()
				}
				
				HStack {
					Text("\(model.charging.name)")
						.font(.headline)
						.bold()
						.foregroundColor(.white)
						.background(Color.black)
						.padding()
				}

				HStack {
					Button(action: { prev() }) {
						Text("Prev")
							.foregroundColor(.white)
							.background(Color.black)
							.padding()
					}
					.padding()

					Button(action: { next() }) {
						Text("Next")
							.foregroundColor(.white)
							.background(Color.black)
							.padding()
				}
					.padding()
				}
			}
		}
		.navigationBarHidden(true)
	}
	
	func prev() {
		let chargies = pack.chargies
		index = (index <= 0 ? chargies.count - 1 : index - 1)
		model.charging = chargies[index]
	}
	
	func next() {
		let chargies = pack.chargies
		index = (index >= chargies.count - 1 ? 0 : index + 1)
		model.charging = chargies[index]
	}
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
		TestView(pack: .chargiePack1)
    }
}

