//
//  ChargieApp.swift
//  Chargie
//
//  Created by Brainflash on 24/11/2020.
//

import SwiftUI

@main
struct ChargieApp: App {
	@StateObject private var model = AppModel()
	@StateObject private var store = Store()

    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(model)
				.environmentObject(store)
				.onAppear() {
					store.inject(model)
				}
				.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
					print(">>> Moved to the foreground!")
				}
				.onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
					print("<<< App moved to background Zzz")
					model.appMode = .normal
				}
				.onContinueUserActivity(NSUserActivity.ChargingAnimationType) { activity in
					print ("Charging Animation Activity: \(activity)\n")
					model.appMode = .charging
				}
				.onContinueUserActivity(NSUserActivity.DisconnectedAnimationType) { activity in
					print ("Disconnected Animation Activity: \(activity)\n")
					model.appMode = .disconnected
				}
        }
    }
}
