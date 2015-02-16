//
//  Dealer.swift
//  Black Jack2
//
//  Created by Yue Zhao on 2/15/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation

class Dealer : Player{
    
    //var score = 0
   // var cards: [card] = []
    var hiddenCard: Card?  //what dose ? mean
    var type :String = ""
    var positionName = "Dealer"
    
    
    /*
    override init (name: String = "Dealer") {
        super.init(name:String.self)
       // self.playerName = "Dealer"  //??
    }
    */
    
    //the card that the dealer show up
    func cardShow() -> Card? {
        cards[0].cd = hiddenCard?.cd! // the syntax??
        return cards[0]
    }
    
    //the sum of the cards of dealer
    func checkSum(type:String) -> (intSum: Int, strSum: String) {
        if (type == "hidden") {
            var intSum = 0
            for each in cards {intSum += each.rank.values.first}
            intSum = intSum - cards[0].rank.values.first
            var strSum: String = "\(intSum)"
            return (intSum, strSum)
        }
        else {
            var intSum = 0
            for each in cards {intSum += each.rank.values.first}
            var strSum:String = "\(intSum)"
            return (intSum, strSum)
        }
    }
    
}
