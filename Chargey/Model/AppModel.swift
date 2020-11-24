//
//  AppModel.swift
//  Chargey
//
//  Created by Brainflash on 24/11/2020.
//

import Foundation

class AppModel: ObservableObject {
	@Published var chargeyPacks = ChargeyPack.all
	
}
