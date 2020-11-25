//
//  ChargeyApp.swift
//  Chargey
//
//  Created by Brainflash on 24/11/2020.
//

import SwiftUI

@main
struct ChargeyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.onContinueUserActivity(NSUserActivity.ChargingAnimationType) { activity in
					print ("Charging Animation Activity: \(activity)")
				}
				.onContinueUserActivity(NSUserActivity.DisconnectedAnimationType) { activity in
					print ("Disconnected Animation Activity: \(activity)")
				}
        }
    }
}
