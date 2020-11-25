//
//  ChargiePack.swift
//  Chargie
//
//  Created by Brainflash on 24/11/2020.
//

import Foundation

class ChargiePack: ObservableObject, Identifiable {
	/// isLocked is false when pack is free or user has purchased the pack
	@Published var isLocked = false
	
	var id: String
	
	init(id: String) {
		self.id = id
	}
}

// MARK: - API

extension ChargiePack {
	
	func lock() {
		isLocked = true
	}
	
	func unlock() {
		isLocked = false
	}
}


