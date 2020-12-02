//
//  PreviewView.swift
//  Chargie
//
//  Created by Brainflash on 01/12/2020.
//

import SwiftUI

struct PreviewView: View {
	@EnvironmentObject private var model: AppModel

	@State var play = false
	@State var index = 0
	@State var chargie: Chargie?
	@ObservedObject var pack: ChargiePack
	
	init(pack: ChargiePack, chargie: Chargie?) {
		self.pack = pack
	}
	
	@ViewBuilder var chargieView: some View {
		if let chargie = chargie {
			ZStack {
				chargie.background
					.edgesIgnoringSafeArea(.all)

				HStack {
					Button(action: { prev() } ) {
						Image(systemName: "arrowtriangle.left.fill")
							.foregroundColor(.black)
							.imageScale(.large)
					}
					.padding(16)
					
					LottieView(chargie: chargie, play: $play)
					
					Button(action: { next() } ) {
						Image(systemName: "arrowtriangle.right")
							.foregroundColor(.black)
							.background(Color.white)
							.imageScale(.large)
					}
					.padding(16)
				}
			}
		} else {
			ZStack {
				Rectangle()
					.fill(Color.gray)
				
				Text("Not found")
			}
		}
	}
	
    var body: some View {
		VStack {
			chargieView
			
			ZStack {
				Color.black
					.edgesIgnoringSafeArea(.all)
			
				HStack {
					Spacer()
					
					Button("Set Charging") {
						model.appMode = .charging
					}
					.foregroundColor(.white)
					.font(.headline)
					.padding()
					
					Spacer()
					
					Button("Set Disconnected") {
						model.appMode = .disconnected
					}
					.padding()
					.font(.headline)
					.foregroundColor(.white)

					Spacer()
				}
			}
			.frame(maxHeight: 80)

			VStack {
				Text("Preview View: \(pack.name)")
					.padding()
				
				Text("Selected Chargie: \(pack.selectedId)")
					.padding()
			}
		}
		.onAppear() {
			self.chargie = pack.selectedChargie
		}
    }
	
	func prev() {
		let chargies = pack.chargies
		index = (index <= 0 ? chargies.count - 1 : index - 1)
		pack.selectedId = chargies[index].id
		self.chargie = pack.selectedChargie
	}
	
	func next() {
		let chargies = pack.chargies
		index = (index >= chargies.count - 1 ? 0 : index + 1)
		pack.selectedId = chargies[index].id
		self.chargie = pack.selectedChargie
	}
}

struct PreviewView_Previews: PreviewProvider {
	static let chargiePack0 = ChargiePack(
		id: "app.chargie.pack0",
		name: "Free",
		chargies: [.progress, .progressColor],
//		selectedId: ""
//		selectedId: "9678-colorfull-loading"
		selectedId: "9678-colorfull-loading"
	)
	
	static let chargiePack1 = ChargiePack(
		id: "app.chargie.pack1",
		name: "Futuristic",
		chargies: [.racing, .superhero, .amongus],
		selectedId: "16732-super-hero-charging"
	)

    static var previews: some View {
		PreviewView(pack: chargiePack1, chargie: .superhero)
			.environmentObject(AppModel())
    }
}
