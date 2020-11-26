//
//  Chargie.swift
//  Chargie
//
//  Created by Brainflash on 25/11/2020.
//

import SwiftUI

class Chargie: ObservableObject {
	var id: String
	var background: Color
	var speed: CGFloat = 1.0
	
	var name: String {
		self.id
	}
	
	init(id: String, background: Color, speed: CGFloat) {
		self.id = id
		self.background = background
		self.speed = speed
	}
}
