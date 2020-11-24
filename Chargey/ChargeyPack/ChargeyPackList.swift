//
//  ChargeyPackList.swift
//  Chargey
//
//  Created by Brainflash on 24/11/2020.
//

import Foundation

// MARK: - ChargeyPacks

extension ChargeyPack {
	static let all: [ChargeyPack] = [
		.chargeyPack1,
		.chargeyPack2,
		.chargeyPack3,
		.chargeyPack4,
		.chargeyPack5
	]
	
	static let chargeyPack1 = ChargeyPack(
		id: "app.chargey.pack1"
	)
	
	static let chargeyPack2 = ChargeyPack(
		id: "app.chargey.pack2"
	)

	static let chargeyPack3 = ChargeyPack(
		id: "app.chargey.pack3"
	)

	static let chargeyPack4 = ChargeyPack(
		id: "app.chargey.pack4"
	)

	static let chargeyPack5 = ChargeyPack(
		id: "app.chargey.pack5"
	)

}
