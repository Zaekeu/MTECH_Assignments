//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Zach on 10/12/22.
//

import UIKit

struct Athlete {
    var name: String
    var age: Int
    var league: String
    var team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
}
