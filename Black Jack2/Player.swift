//
//  Player.swift
//  Black Jack2
//
//  Created by Yue Zhao on 2/15/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation
class Player {
    var name: String = "Player"
    var score = 0
    var cards:[Card] = []
    var chipAmount = 100
    var bet = 0
    var stand:Bool = false
    
    /*init (name: String) {
        self.playerName = "Player"  //??
    }*/
    
    //stand function
    func Stand() {
        
    }
    
    func addCard (card: Card){
        cards.append(card);  
    }
    
    func checkSum() -> (intSum:Int, strSum: String) {
        var intSum = 0
        for each in cards
        {
            intSum += each.rank.values.first
        }
        var strSum = "\(intSum)"
        return (intSum,strSum)  //why return two?
    }
    
    //changing the value for stand attribute ???? 
    var setStand: Bool {
        get {return self.stand}
        set(newBoolValue) { self.stand = newBoolValue}
    }
    
}