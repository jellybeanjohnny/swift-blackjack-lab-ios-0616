//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	/**
	
	* Declare any custom properties here.
	
	*/
	let dealer: Dealer = Dealer()
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		
		/*
		
		* Call your custom classes here when running the scheme.
		
		*/
		
		playBlackjack()
		
		// Do not alter
		return true  //
	}   ///////////////
	
	/*
	
	* Write your playBlackjack method in here
	
	*/
	
	func playBlackjack() {
		
		// Place a bet
		if !dealer.placeBet(10) {
			print("Players cannot afford bet")
			return
		}
		
		// Start off dealing each house and player two cards
		print("Dealing first two cards")
		dealer.deal()
		
		// Max possible 3 more turns
		for _ in 1...3 {
			// player's turn
			print("Player's turn")
			dealer.turn(dealer.player)
			print(dealer.player.description)
			
			// Check for winner
			print("Check for winner")
			if dealer.winner() != "no" {
				break
			}
			
			// House's turn
			print("House's turn")
			dealer.turn(dealer.house)
			print(dealer.house.description)
			
			// Check for winner
			print("Check for winner")
			if dealer.winner() != "no" {
				break
			}
		}
		
		// Award the bet to the winner
		print(dealer.award())
		
	}
	
	
}

