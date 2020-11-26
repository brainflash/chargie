//
//  ChargiePackList.swift
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
	
	static let chargiePack1 = ChargiePack(
		id: "app.chargie.pack1",
		chargies: [ .racing, .amongus ]
	)
	
	static let chargiePack2 = ChargiePack(
		id: "app.chargie.pack2",
		chargies: []
	)

	static let chargiePack3 = ChargiePack(
		id: "app.chargie.pack3",
		chargies: []
	)

	static let chargiePack4 = ChargiePack(
		id: "app.chargie.pack4",
		chargies: []
	)

	static let chargiePack5 = ChargiePack(
		id: "app.chargie.pack5",
		chargies: []
	)

}
