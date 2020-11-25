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
	
	@Published var chargingAnimation = "9678-colorfull-loading"
	@Published var disconnectedAnimation  = "36318-cat-preloader"
	
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
