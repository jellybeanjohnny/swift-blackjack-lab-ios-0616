//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Matt Amerige on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House : Player {
	
	var mustHit: Bool {
		if handscore >= 17 {
			return false
		}
		return true
	}
	
	override init(name: String) {
		super.init(name: name)
		tokens = 1000
	}
	
}