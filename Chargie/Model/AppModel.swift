//
//  AppModel.swift
//  Chargie
//
//  Created by Brainflash on 24/11/2020.
//

import Foundation
import Combine

class AppModel: ObservableObject {
	@Published var chargiePacks = ChargiePack.all
	@Published var appMode: AppMode = .normal

	@Published var charging: Chargie		= .racing
	@Published var disconnected: Chargie	= .amongus
	
	var chargie: Chargie {
		appMode == .charging ? charging : disconnected
	}

//	@Published var chargingAnimation 		= "9678-colorfull-loading"
//	@Published var chargingAnimation 		= "39701-robot-bot-3d"
//	@Published var chargingAnimation 		= "39589-space-ride"
	@Published var chargingAnimation 		= "13308-merry-christmas"
//	@Published var chargingAnimation 		= "

//	@Published var disconnectedAnimation  	= "36318-cat-preloader"
//	@Published var disconnectedAnimation  	= "38916-infinity-rainbow"
	@Published var disconnectedAnimation  	= "37725-loading-50-among-us"

//	@Published var disconnectedAnimation  	= "

	// Play animation
	@Published var play: Int = 0

	enum AppMode: String {
		case normal = "Normal"
		case charging = "Charging"
		case disconnected = "Disconnected"
	}
	
}

// MARK: - API

extension AppModel {
}
