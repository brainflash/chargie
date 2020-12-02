//
//  ChargiePreview.swift
//  Chargie
//
//  Created by Brainflash on 01/12/2020.
//

import SwiftUI

struct ChargiePreview: View {
	var pack: ChargiePack
	var chargie: Chargie
	var style: Style
	@State private var play = true
	
	enum Style {
		case thumbnail
		case preview
	}
	
	var shape = RoundedRectangle(cornerRadius: 16, style: .continuous)

    var body: some View {
		ZStack {
			if style == .thumbnail {
				Image("\(pack.name)/\(chargie.imageName)")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.accessibility(hidden: true)
			}
			
			if style == .preview {
				LottieView(chargie: chargie, play: $play)
			}
		}
		.frame(minWidth: 96, maxWidth: 400, maxHeight: 500)
		.clipShape(shape)
		.contentShape(shape)
    }
}

struct ChargiePreview_Previews: PreviewProvider {
    static var previews: some View {
		ChargiePreview(pack: .chargiePack1, chargie: .amongus, style: .thumbnail)
    }
}
