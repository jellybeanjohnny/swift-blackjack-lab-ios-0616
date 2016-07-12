//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Matt Amerige on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
	
	let suit: String
	let rank: String
	let cardLabel: String
	
	var cardValue: UInt {
	
		switch rank {
		case "A":  return 1
		case "J", "Q", "K": return 10
		default:
			if let value = UInt(rank) {
				return value
			}
			else {
				print("Invalid Rank!")
				return 0
			}
		}
	}
	
	var description: String {
		return cardLabel
	}
	
	init(suit: String, rank: String) {
		self.suit = suit
		self.rank = rank
		self.cardLabel = "\(suit)\(rank)"
	}
	
	class func validSuits() -> [String] {
		return ["♠︎", "♥︎", "♦︎", "♣︎"]
	}
	
	class func validRanks() -> [String] {
		return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
	}

	
}
