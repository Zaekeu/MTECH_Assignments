//
//  Player.swift
//  ScoreKeeperApp
//
//  Created by Zach on 11/18/22.
//

import Foundation

struct Player: Codable, Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.currentScore > rhs.currentScore
    }
    
    var name: String
    var currentScore: Int
}
