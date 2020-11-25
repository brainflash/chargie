//
//  AppModel.swift
//  Chargie
//
//  Created by Brainflash on 24/11/2020.
//

import Foundation

class AppModel: ObservableObject {
	@Published var chargiePacks = ChargiePack.all
	
}
