//
//  PackRow.swift
//  Chargie
//
//  Created by Brainflash on 26/11/2020.
//

import SwiftUI

struct PackRow: View {
	@EnvironmentObject private var store: Store
	@ObservedObject var pack: ChargiePack
	@Namespace private var namespace
	
	@Binding var selectedPack: ChargiePack?
	
	var clipShape = RoundedRectangle(cornerRadius: 10, style: .continuous)
	
	var blurView: some View {
		#if os(iOS)
		return VisualEffectBlur(blurStyle: .systemThinMaterialLight)
		#else
		return VisualEffectBlur()
		#endif
	}
	
    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				Text(pack.name)
					.font(.headline)
					.foregroundColor(.black)
					.padding(.leading, 15)
					.padding(.top, 5)

				Spacer()
				
				if let product = store.product(for: pack.id) {
					UnlockButton(product: .init(for: product), purchaseAction: {
						store.purchaseProduct(product)
					})
				}
			}
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					ForEach(pack.chargies) { chargie in
//						Button(action: { select(chargie: chargie) }) {
//							ChargiePreview(pack: pack, chargie: chargie, style: .thumbnail)
//								.frame(width: 96, height: 96)
//								.matchedGeometryEffect(id: chargie.id, in: namespace, isSource: )
//						}
//						ChargiePreview(pack: pack, chargie: chargie, style: .thumbnail)
						
						Button(action: { selectedPack = pack; pack.selectedId = chargie.id } ) {
							Image("\(pack.name)/\(chargie.imageName)")
								.resizable()
								.aspectRatio(contentMode: .fill)
								.frame(width: 96, height: 96)
								.clipShape(clipShape)
								.accessibility(hidden: true)
						}
					}
				}
			}
			.padding(8)
		}
		.listRowBackground(blurView
							.clipped()
							.cornerRadius(20.0)
							.padding(8)
		)
		.padding(.vertical, 8)
	}
}

struct PackRow_Previews: PreviewProvider {
	static var selectedPack = Binding<ChargiePack?>.constant(.chargiePack1)
	
    static var previews: some View {
		PackRow(pack: .chargiePack1, selectedPack: selectedPack)
			.environmentObject(Store())
    }
}


/*
	Video Thumbnails snippet
	
import AVKit

//					let url = pack.videoURL(chargie)

					
					// TOOD: WIP Snippet here for video thumbnail
					// Trying to get the video to loop
					// Also want to hide the player controls
					//
					// Example video: 9678-colorfull-loading.mp4
					//	Place in Chargies/Charging/videothumbs/
					//
					if chargie.options?.videothumb != nil {
						if let url = pack.videoURL(chargie) {
//							let asset = AVAsset(url: url)
//							let playerItem = AVPlayerItem(asset: asset)
//							let player = AVQueuePlayer()
//							let looper = AVPlayerLooper(player: player, templateItem: playerItem)
							
							let player = AVPlayer(url: url)
							VideoPlayer(player: player)
								.onAppear() {
									player.play()
								}
						}
					}
*/
