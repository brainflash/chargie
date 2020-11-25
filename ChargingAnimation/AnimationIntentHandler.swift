//
//  AnimationIntentHandler.swift
//  Chargey
//
//	Handler for charging animation
//
//  Created by Brainflash on 24/11/2020.
//

import Foundation

class AnimationIntentHandler: NSObject, ChargingAnimationIntentHandling {
	
	func handle(intent: ChargingAnimationIntent, completion: @escaping (ChargingAnimationIntentResponse) -> Void) {
//		print ("Charging Animation Intent: handle intent")

		let userActivity = NSUserActivity(activityType: NSUserActivity.ChargingAnimationType)
		userActivity.addUserInfoEntries(from: [NSUserActivity.ChargingAnimationType: "1"])
		
		let response = ChargingAnimationIntentResponse(code: .continueInApp, userActivity: userActivity)
		completion(response)
	}
	
	
}

class DisconnectedIntentHandler: NSObject, DisconnectedAnimationIntentHandling {
	
	func handle(intent: DisconnectedAnimationIntent, completion: @escaping (DisconnectedAnimationIntentResponse) -> Void) {
		let userActivity = NSUserActivity(activityType: NSUserActivity.DisconnectedAnimationType)
		userActivity.addUserInfoEntries(from: [NSUserActivity.DisconnectedAnimationType: "1"])
		
		let response = DisconnectedAnimationIntentResponse(code: .continueInApp, userActivity: userActivity)
		completion(response)
	}
}
