//
//  ChargiePack+SwiftUI.swift
//  Chargie
//
//  Created by Brainflash on 26/11/2020.
//

import SwiftUI

extension ChargiePack {
	var image: Image {
		Image("\(self.name)/image1", label: Text(self.name))
			.renderingMode(.original)
	}
	
	var images: [Image] {
		self.chargies.map { chargie in
			Image("\(self.name)/\(chargie.name.lowercased())", label: Text(chargie.name))
				.renderingMode(.original)
		}
	}
	
	func videoURL(_ chargie: Chargie) -> URL? {
		let subdir = "Resources/\(self.name)/videothumbs/"
		print(subdir)
		let path = "/Chargies/\(self.name)/videothumbs/\(chargie.id).mp4"
		let url = Bundle.main.bundleURL.appendingPathComponent(path)
		return url
		
//		return Bundle.main.url(forResource: chargie.id, withExtension: "mp4", subdirectory: "/Chargies/\(self.name)/videothumbs/")
	}
}
