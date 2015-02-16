//
//  ViewController.swift
//  Black Jack2
//
//  Created by Yue Zhao on 2/14/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var Title: UILabel!
    @IBOutlet weak var betInput: UITextField!

    @IBOutlet weak var blanceNumber: UILabel!
    @IBOutlet weak var blance: UILabel!
    @IBOutlet weak var betButton: UIButton!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
  
    @IBOutlet weak var chipBalance: UILabel!
    
    @IBOutlet weak var Playercard2: UILabel!
    @IBOutlet weak var playercard1: UILabel!
    
    @IBOutlet weak var Playercard3: UILabel!
    
    @IBOutlet weak var Playercard4: UILabel!
    
    @IBOutlet weak var Playercard5: UILabel!
    
    @IBOutlet weak var playersum: UILabel!

    @IBOutlet weak var dealercard1: UILabel!
    
    @IBOutlet weak var dealercard2: UILabel!
    
    @IBOutlet weak var dealercard3: UILabel!
    
    @IBOutlet weak var dealercard4: UILabel!
    
    @IBOutlet weak var dealercard5: UILabel!
    
    @IBOutlet weak var dealersum: UILabel!
    
    @IBOutlet weak var standButton: UIButton!
    
    var playerLabels:[UILabel] = []
    var dealerLabels:[UILabel] = []
    var blackjack: Game!
    var cntchip:Int = 100
    @IBAction func Bet(sender: UIButton) {
        cntchip -= betInput.text.toInt()!
        chipBalance.text = "\(cntchip)"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playerLabels += [playercard1, Playercard2, Playercard3, Playercard4, Playercard5]
        dealerLabels += [dealercard1, dealercard2, dealercard3, dealercard4, dealercard5]
        blackjack = Game (deckSize: 1, playerNumber: 1)
        getPlayerStats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func standButton(sender: UIButton) {
        blackjack.stand(0)
        getPlayerStats()
    }
    
    @IBAction func hitButton(sender: UIButton) {
        blackjack.hit(blackjack.currentPlayer)
        var current:Int = blackjack.player.checkSum().intSum
        if (current > 21) {
            for x in 0..<blackjack.player.cards.count {
                playerLabels[x].text = nil
            }
            blackjack.stand(blackjack.currentPlayer)
        }
        getPlayerStats()
        
    }
    
    
    @IBAction func retry(sender: UIButton) {
        retryButton.hidden = true
        hitButton.hidden = false
        standButton.hidden = false
        blackjack.player.stand = false
        //dealerLabels.removeAll(keepCapacity: false)
        for i in 0..<2 {dealerLabels[i].text = " "}
        for i in 0..<5 {playerLabels[i].text = " "}
        
        blackjack.player.cards.removeAll(keepCapacity: false)
        blackjack.dealer.cards.removeAll(keepCapacity: false)
        
        //viewDidLoad()
        
        
        for k in 0..<2{blackjack.player.addCard(blackjack.catchCard(blackjack.currentDeck)!)}
        blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
        blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
        
        
        getPlayerStats()
        
    }
    
    func getPlayerStats (){
        var alreadystand = 0
        reload()
        dealersum.text = blackjack.dealer.checkSum("hidden").strSum    //
        if (blackjack.player.stand == true) {
            alreadystand += 1
        }
        
        if (alreadystand > 0) {
            dealerLabels[0].text = blackjack.dealer.cardShow()?.cd //??
            hitButton.hidden = true
            standButton.hidden = true
            while (blackjack.dealer.checkSum().intSum < 16) {
                blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
            }
            
            dealersum.text = blackjack.dealer.checkSum().strSum
            playersum.text = showScore(blackjack.player.checkSum().intSum, dealerScore: blackjack.dealer.checkSum().intSum)
            retryButton.hidden = false
        }
        chipBalance.text = "\(cntchip)"
        //var current : Int = cntchip - betInput.text.toInt()!
        //chipBalance.text = "\(current)"
        
        
    }
    
    func showScore(playerScore: Int, dealerScore: Int) -> String {
        if (playerScore > 21) {
            return ("Bust!")
        }
        
        if (dealerScore > 21) {
            cntchip += 2*betInput.text.toInt()!
            return ("Dealer bust! You Win!")
        }
        
        if (playerScore == 21 && dealerScore != 21) {
            cntchip += 4*betInput.text.toInt()!
            return ("Awesome! You got a Blak Jack!😄")
        }
        
        if (playerScore > dealerScore) {
            cntchip += 2*betInput.text.toInt()!
            return ("You win!")
        }
        
        if (playerScore < dealerScore) {
            return ("Unluck😔")
        }
        cntchip += betInput.text.toInt()!
        return ("Push")
        
        
    }
    
    func reload() {
        for x in 0..<blackjack.player.cards.count {
            playerLabels[x].text = blackjack.player.cards[x].cd
            playersum.text = blackjack.player.checkSum().strSum
            
        }
        for y in 0..<blackjack.dealer.cards.count {
            dealerLabels[y].text = blackjack.dealer.cards[y].cd
        }
    }
    

}

