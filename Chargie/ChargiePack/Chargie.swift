//
//  Chargie.swift
//  Chargie
//
//  Created by Brainflash on 25/11/2020.
//

import SwiftUI

class Chargie: ObservableObject, Identifiable {
	var name: String
	var id: String
	var background: Color
	var speed: CGFloat = 1.0
	var options: Options? = nil
	
	struct Options {
		var videothumb: Bool = false
	}
	
	var imageName: String {
		self.name.lowercased()
	}
	
	init(name: String, id: String, background: Color, speed: CGFloat, options: Options? = nil) {
		self.name = name
		self.id = id
		self.background = background
		self.speed = speed
		self.options = options
	}
}
