//
//  ChargiePack.swift
//  Chargie
//
//  Created by Brainflash on 24/11/2020.
//

import Foundation

class ChargiePack: ObservableObject, Equatable, Identifiable {
	/// isLocked is false when pack is free or user has purchased the pack
	@Published var isLocked = false
	var chargies: [Chargie]
	
	var id: String
	var name: String
	/// Used by UI when selecting a Chargie in the menu view
	var selectedId: String = ""
	
	init(id: String, name: String, chargies: [Chargie], selectedId: String = "") {
		self.id = id
		self.name = name
		self.chargies = chargies
		self.selectedId = selectedId
	}

	static func == (lhs: ChargiePack, rhs: ChargiePack) -> Bool {
		lhs.id == rhs.id
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
	
	var selectedChargie: Chargie? {
		guard selectedId != "" else { return nil }
		return self.chargies.filter { $0.id == selectedId }.first ?? nil
	}
	
	var selectedChargieIndex: Int {
		guard selectedId != "" else { return -1 }
		return self.chargies.firstIndex(where: { $0.id == selectedId })!
	}

}


