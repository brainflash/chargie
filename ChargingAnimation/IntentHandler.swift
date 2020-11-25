//
//  IntentHandler.swift
//  ChargingAnimation
//
//  Created by Brainflash on 24/11/2020.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
		guard intent is ChargingAnimationIntent || intent is DisconnectedAnimationIntent else {
			fatalError("Unhandled intent type: \(intent)")
		}
		if intent is ChargingAnimationIntent {
			let animationHandler = AnimationIntentHandler()
			return animationHandler
		}
		let animationHandler = DisconnectedIntentHandler()
		return animationHandler
    }
    
}
