//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Matt Amerige on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
	
	let name: String
	var cards: [Card] = []
	
	var handscore: UInt {
		return calculateHandscore()
	}
	
	var blackjack: Bool {
		if cards.count == 2 && handscore == 21 {
			return true
		}
		return false
	}
	
	var busted: Bool {
		if handscore > 21 {
			return true
		}
		return false
	}
	
	var stayed: Bool = false
	
	var mayHit: Bool {
		if !busted && !blackjack && !stayed {
			return true
		}
		return false
	}
	
	var tokens: UInt = 100
	
	var description: String {
		return "Player Info:\nCards: \(printCards())\nHandscore: \(handscore)\nBlackjack: \(blackjack)\nBusted: \(busted)\nStayed: \(stayed)\nTokens:\(tokens)"
	}
	
	func printCards() {
		for card in cards {
			print("\(card.description)")
		}
	}
	
	init(name: String) {
		self.name = name
	}
	
	func calculateHandscore() -> UInt {
		
		var score: UInt = 0
		
		// Get all cards that are ACE
		let aces = cards.filter(isAce)
		
		for card in cards {
			if card.cardLabel.containsString("A") {
				// Adding aces initiall as a 1. Check later to see if we can use any as 11s
				score += 1
			}
			else {
				score += card.cardValue
			}
		}
		
		// Make 1 ace an 11
		if (!aces.isEmpty) && (score + 10 <= 21) {
			// Remove the ace value of 1 we added before
			score -= 1
			// Add it back in as an 11
			score += 11
		}
		
		return score
	}
	
	func isAce(card: Card) -> Bool {
		if card.cardLabel.containsString("A") {
			return true
		}
		return false
	}
	
	func canPlaceBet(bet: UInt) ->Bool {
		if bet <= tokens {
			return true
		}
		return false
	}
	
	func didWin(bet: UInt) {
		tokens += bet
	}
	
	func didLose(bet: UInt) {
		tokens -= bet
	}
	
	
}