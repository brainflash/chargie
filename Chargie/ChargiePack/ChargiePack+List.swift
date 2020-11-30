//
//  ChargiePack+List.swift
//  Chargie
//
//  Created by Brainflash on 24/11/2020.
//

import Foundation

// MARK: - ChargiePacks

extension ChargiePack {
	static let all: [ChargiePack] = [
		.chargiePack1,
		.chargiePack2,
		.chargiePack3,
		.chargiePack4,
		.chargiePack5
	]
	
	// Free
	static let chargiePack0 = ChargiePack(
		id: "app.chargie.pack0",
		name: "Free",
		chargies: [.progress, .progressColor]
	)
	
	// Futuristic & Games
	static let chargiePack1 = ChargiePack(
		id: "app.chargie.pack1",
		name: "Futuristic",
		chargies: [.racing, .superhero, .amongus]
	)
	
	// Christmas
	static let chargiePack2 = ChargiePack(
		id: "app.chargie.pack2",
		name: "Christmas",
		chargies: [.xmasbird]
	)

	// Fashion
	static let chargiePack3 = ChargiePack(
		id: "app.chargie.pack3",
		name: "Fashion",
		chargies: [.reddress]
	)

	// Animals
	static let chargiePack4 = ChargiePack(
		id: "app.chargie.pack4",
		name: "Animals",
		chargies: [.animals]
	)

	// Charging
	static let chargiePack5 = ChargiePack(
		id: "app.chargie.pack5",
		name: "Charging",
		chargies: [.progress, .progressColor]
	)

}
