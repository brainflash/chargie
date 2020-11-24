//
//  IntentHandler.swift
//  ChargingAnimation
//
//  Created by Brainflash on 24/11/2020.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
		guard intent is ChargingAnimationIntent else {
			fatalError("Unhandled intent type: \(intent)")
		}
		let animationHandler = AnimationIntentHandler()
		return animationHandler
    }
    
}
