//
//  ViewController.swift
//  rockPaperscissors
//
//  Created by FREDERICK MARTIN on 11/11/18.
//  Copyright © 2018 Fredrex Enterprises. All rights reserved.
//

import UIKit

///

class ViewController: UIViewController {
    @IBOutlet weak var alienFace: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var alienScore: Int = 0
    var playerScore: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetBoard()
    }
    
    
    func resetBoard(){
        
        alienFace.text = "👽"
        
        if playerScore == 0 && alienScore == 00 {
            
            statusLabel.text =  "Rock Paper and Scissors?"
            
        }else{
            
            statusLabel.text = "Wins: \(playerScore) Losses \(alienScore)"
        }
        
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
        
        
    }
    
    
    func play(playerPick: Sign) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        let opponent = randomSign()
        alienFace.text = opponent.emoji
        
        let theResult = playerPick.playingTheGame(opponent)
        
        switch theResult{
            
        case .draw:
            statusLabel.text = "It is a Draw!"
        case .commence:
            statusLabel.text = "Rock, Paper, Scissors?"
        case .lose:
            statusLabel.text = "You Lose!"
            alienScore += 1
            
        case .win:
            statusLabel.text = "You Win!"
            playerScore += 1
            
            
        }
        
        switch playerPick{
            
        case .rock:
            
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            
        case .paper:
            
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
            
        case .scissors:
            
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            
        }
        
        playAgainButton.isHidden = false
        
        
        
        
        
    
        
    }
    
    @IBAction func playAgainSelected(_ sender: Any) {
        
        resetBoard()
    }
    
    @IBAction func rockSelected(_ sender: Any) {
        
        play(playerPick: Sign.rock)
        
    }
    
    @IBAction func scissorSelected(_ sender: Any) {
        
        play(playerPick: Sign.scissors)
        
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        
        play(playerPick: Sign.paper)
        
    }
    

}

