//
//  PackRow.swift
//  Chargie
//
//  Created by Brainflash on 26/11/2020.
//

import SwiftUI

struct PackRow: View {
	@ObservedObject var pack: ChargiePack
	
	var clipShape = RoundedRectangle(cornerRadius: 10, style: .continuous)
	
    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				ForEach(pack.chargies) { chargie in
					
/*
					
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
					
					
					Image("\(pack.name)/\(chargie.imageName)")
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 96, height: 96)
						.clipShape(clipShape)
//						.shadow(color: Color.white, radius: 2, x: -4, y: 4)
						.overlay(clipShape
									.inset(by: 1)
									.stroke(Color.white, lineWidth: chargie.background == .black ? 2 : 0))
						.accessibility(hidden: true)
				}
//				pack.images.forEach { image in
//					image
//						.resizable()
//				}
			}
//			pack.image
//				.resizable()
//				.aspectRatio(contentMode: .fill)
//				.frame(width: 96, height: 96)
//				.clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//				.accessibility(hidden: true)
			
			Text(pack.name)
				.font(.headline)
				.foregroundColor(.white)
				.padding(.leading, 15)
				.padding(.top, 5)
		}
		.listRowBackground(Color.black)
    }
}

struct PackRow_Previews: PreviewProvider {
    static var previews: some View {
		PackRow(pack: .chargiePack1)
    }
}
