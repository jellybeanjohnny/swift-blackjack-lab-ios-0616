//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Matt Amerige on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
	
	private var remainingCards: [Card]
	private var dealtCards: [Card] = []
	
	var description: String {
		return "Cards Remaining: \(remainingCards.count)\nCards Dealt: \(dealtCards.count)"
	}
	
	init() {
		remainingCards = Deck.generateCards()
	}
	
	private class func generateCards() -> [Card] {
		
		var cards: [Card] = []
		
		for suit in Card.validSuits() {
			for rank in Card.validRanks() {
				// Make a new card
				let card = Card(suit: suit, rank: rank)
				// Append it to the array
				cards.append(card)
			}
		}
		return cards
	}
	
	func drawCard() -> Card {
		
		// Take a card from the remaining card pile
		let card = remainingCards[remainingCards.count - 1]
		
		// Remove the card from the array
		remainingCards.removeLast()
		
		// Add the card to the dealt card array
		dealtCards.append(card)
		
		return card
	}
	
	func shuffle() {
		// Gather the dealt cards and put them back into the remaining cards
		remainingCards.appendContentsOf(dealtCards)
		
		// Empty the dealt cards
		dealtCards.removeAll()
		
		// Randomize the 52 cards
		randomize()
		
	}
	
	func randomize() {
		for _ in 0...51 {
			// Pick two random indicies
			let first = arc4random_uniform(UInt32(remainingCards.count - 1))
			let second = arc4random_uniform(UInt32(remainingCards.count - 1))
			(remainingCards[Int(first)], remainingCards[Int(second)]) = (remainingCards[Int(second)], remainingCards[Int(first)])
		}
	}
	
	
	
}





















