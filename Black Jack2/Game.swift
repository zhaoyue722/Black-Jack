//
//  Game.swift
//  Black Jack2
//
//  Created by Yue Zhao on 2/15/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation

class Game {
    var decks: [Deck]=[]
    var player: Player = Player()
    var dealer: Dealer = Dealer()
    var currentPlayer = 0
    var currentDeck = 0
    //var size:Game
    
   /*
    init (number:Int = 1) {
        var tempDeck = Deck ()
        tempDeck.createDeck()
        decks.append(tempDeck)
    }
*/

    
    init (deckSize: Int, playerNumber: Int) {
       
        var tempDeck = Deck ()
        tempDeck.createDeck()
        decks.append(tempDeck)
        
        for i in 0..<2 {player.addCard(catchCard(currentDeck)!)}
        dealer.addCard(catchCard(currentDeck)!)
        dealer.addCard(catchCard(currentDeck)!)
        dealer.hiddenCard = dealer.cards[0]
    }
    

    
    //clean deck to restart the game
    func cleanDeck() {
        decks.removeAll(keepCapacity: false)
    }
    
    func displayDeck() {
        for n in 0..<decks.count {
            for m in 0..<decks[n].cards.count {
                NSLog("\(decks[n].cards[m].description)")
            
            }
        }
    }
    
    func catchCard(cardm: Int) ->Card? {
        //if (size.decks[currentDeck].cards.count <= 10) {currentDeck += 1}
        return decks[cardm].getCard()
        
    }
    
    func hit (playerm: Int) {
        var card = catchCard(currentDeck)
        player.addCard(card!)
    }
    
    func stand (playerm: Int) {
        if (player.stand == false) {
            player.setStand = true
            currentPlayer += 1
            if (currentPlayer > 0) {currentPlayer = 0}
        }
        else {
            currentPlayer += 1
            if (currentPlayer > 0) {currentPlayer = 0}

        }
    }
    
    
    
}

