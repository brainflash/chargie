//
//  AppModel+Battery.swift
//  Chargie
//
//  Created by Brainflash on 30/11/2020.
//

import UIKit

extension AppModel {
	func startBatteryMonitor() {
		UIDevice.current.isBatteryMonitoringEnabled = true
		
		NotificationCenter.default.addObserver(self, selector: #selector(chargeStateChanged), name: UIDevice.batteryStateDidChangeNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelChanged), name: UIDevice.batteryLevelDidChangeNotification, object: nil)
		
		self.batteryLevel = self.batteryLevelText
		self.chargingStatus = chargeStateText(UIDevice.current.batteryState)
		print("Battery level: \(batteryLevel)")
		print("Charge state: \(chargingStatus)")
	}
	
//	var chargingStatus: String {
//		let status = self.chargeStateText(UIDevice.current.batteryState)
//		return status
//	}
	
	private var batteryLevelText: String {
		return String(format: "%.0f%%", UIDevice.current.batteryLevel * 100)
	}
	
	private func chargeStateText(_ state: UIDevice.BatteryState) -> String {
		var str = ""
		switch state {
		case .unknown:
			str = "Unknown"
		case .unplugged:
			str = "Unplugged"
		case .charging:
			str = "Charging"
		case .full:
			str = "Full"
		default:
			str = "Unknown"
		}
		return str
	}
	
	@objc func chargeStateChanged(_ notification: Notification) {
		let chargeState = chargeStateText(UIDevice.current.batteryState)
		print("Charge state changed \(chargeState)")
		self.chargingStatus = chargeState
	}
	
	@objc func batteryLevelChanged(_ notification: Notification) {
		let level = batteryLevelText
		print("Battery level changed \(level)")
		self.batteryLevel = "\(level)"
	}
}
