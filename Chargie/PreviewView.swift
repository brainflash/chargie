//
//  PreviewView.swift
//  Chargie
//
//  Created by Brainflash on 01/12/2020.
//

import SwiftUI

struct PreviewView: View {
	@EnvironmentObject private var model: AppModel
	@Environment(\.presentationMode) var presentation
	
	@State var showingActionSheet = false
	@State var isExitButtonPresented = false

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
//					Button(action: { prev() } ) {
//						Image(systemName: "arrowtriangle.left.fill")
//							.renderingMode(.template)
//							.foregroundColor(.white)
//							.imageScale(.large)
//					}
//					.padding(16)
					
					LottieView(chargie: chargie, play: $play)
					
//					Button(action: { next() } ) {
//						Image(systemName: "arrowtriangle.right.fill")
//							.renderingMode(.template)
//							.foregroundColor(.white)
//							.imageScale(.large)
//					}
//					.padding(16)
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
	
	var minWidth: CGFloat {
		return 80
	}
	
	var setButton: some View {
		Button(action: { self.showingActionSheet = true} ) {
			Text("Set")
				.font(.subheadline)
				.bold()
				.foregroundColor(Color.white)
				.padding(.horizontal, 16)
				.padding(.vertical, 8)
				.frame(minWidth: minWidth)
				.background(Color.blue)
				.clipShape(Capsule())
				.contentShape(Rectangle())
		}
	}
	
	var sleepButton: some View {
		Button(action: { ChargieApp.sendToSleep() } ) {
			Text("Sleep")
				.font(.subheadline)
				.bold()
				.foregroundColor(Color.white)
				.padding(.horizontal, 16)
				.padding(.vertical, 8)
				.frame(minWidth: minWidth)
				.background(Color.blue)
				.clipShape(Capsule())
				.contentShape(Rectangle())
		}
	}

    var body: some View {
		VStack {
			VStack {
				chargieView

//				HStack(alignment: .bottom) {
//					Text("Preview View: \(pack.name)")
//						.padding(6)
//
//					Text("Selected Chargie: \(pack.selectedId)")
//						.padding(6)
//				}
			}

			ZStack {
				Color.black
					.edgesIgnoringSafeArea(.all)

				VStack {
					Spacer()
					
					HStack {
						Spacer()

						setButton
						
						Spacer()
						
						sleepButton
						
						Spacer()
					}
					
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
			}
			.frame(maxHeight: 80)


		}
		.onAppear() {
			self.chargie = pack.selectedChargie
			self.index = pack.selectedChargieIndex
		}
		.overlay(ExitButton(isOn: $isExitButtonPresented, fadeOut: false) {
			isExitButtonPresented.toggle();
			self.presentation.wrappedValue.dismiss()
		}.animation(.easeInOut(duration: 0.25)), alignment: .topTrailing)
		.onTapGesture {
			isExitButtonPresented.toggle()
		}
		.actionSheet(isPresented: $showingActionSheet) {
			ActionSheet(title: Text("Hello"), buttons: [
				.default(Text("Set Charging")) { model.charging = chargie! },
				.default(Text("Set Disconnected")) { model.disconnected = chargie! },
				.default(Text("Set Both")) { model.charging = chargie!; model.disconnected = chargie! },
				.cancel()
			])
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
