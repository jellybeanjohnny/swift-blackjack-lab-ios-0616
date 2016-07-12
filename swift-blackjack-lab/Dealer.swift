//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Matt Amerige on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
	
	let deck: Deck = Deck()
	let house: House = House(name: "House")
	let player: House = House(name: "Player")
	var bet: UInt = 0

	func placeBet(bet: UInt) -> (Bool) {
		// Check if the house and player can afford the bet
		if (player.tokens < bet) || (house.tokens <= bet) {
			return false
		}
		
		self.bet = bet
		
		return true
	}
	
	func deal() {
		
		house.cards.removeAll()
		player.cards.removeAll()
		deck.shuffle()
		
		player.stayed = false
		house.stayed = false
		for _ in 0..<2 {
			// Draw a card and give to the player
			player.cards.append(deck.drawCard())
			// same for the house
			house.cards.append(deck.drawCard())
		}
	}
	
	func turn(house: House) {
		if house.mayHit {
			if house.mustHit {
				house.cards.append(deck.drawCard())
			}
			else {
				house.stayed = true
			}
		}
	}
	
	// This is really ugly. fix!
	func winner() -> String {
		if house.busted {
			return "player"
		}
		else if player.busted{
			return "house"
		}
		
		if player.blackjack && !house.blackjack {
			return "player"
		}
		
		if house.blackjack && !player.blackjack {
			return "house"
		}
		
		if player.cards.count == 5 {
			return "player"
		}
		
		if (house.stayed && player.stayed) && (player.handscore > house.handscore) {
			return "player"
		}
		
		if (house.stayed && player.stayed) && (house.handscore >= player.handscore) {
			return "house"
		}
		return "no"
	}
	
	func award() -> String {
		let theWinner = winner()
		if theWinner == "player" {
			player.tokens += bet
			house.tokens -= bet
		}
		else if theWinner == "house" {
			house.tokens += bet
			player.tokens -= bet
		}
		else {
			return "no winner"
		}
		return "The \(theWinner) wins"
	}
	
	
}