//
//  sign.swift
//  rockPaperscissors
//
//  Created by FREDERICK MARTIN on 11/11/18.
//  Copyright © 2018 Fredrex Enterprises. All rights reserved.
//

import Foundation

import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign{
    
    let Sign = randomChoice.nextInt()
    
    switch Sign{
        
        case 0:
            
            return .rock
        
        case 1:
            
            return .paper
        
        default:
            
            return .scissors
        
    }
    
    
    
}

enum Sign{
    
    case rock, paper, scissors
    
    var emoji: String{
        switch self{
        case.rock: return "👊"
        case.paper: return "🖐"
        case.scissors: return "✌️"
        
        }
    }
    
        func playingTheGame(_ opponent: Sign) -> GameState {
            
            switch self {
                
            case .rock:
                
                switch opponent{
                    
                case .paper:
                    
                    return GameState.lose
                    
                case .rock:
                    
                    return GameState.draw
                    
                case .scissors:
                
                    return GameState.win
                    
                }
            
            case .paper:
                
                switch opponent{
                    
                case .paper:
                    
                    return GameState.draw
                    
                case .rock:
                    
                    return GameState.win
                    
                case .scissors:
                    
                    return GameState.lose
                    
                }
                
            case .scissors:
            
                switch opponent{
                    
                case .paper:
                    
                    return GameState.win
                    
                case .rock:
                    
                    return GameState.lose
                    
                case .scissors:
                    
                    return GameState.draw
            }
               
                    
        }

    }

}


