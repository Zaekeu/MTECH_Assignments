//
//  Dog.swift
//  APIProject
//
//  Created by Zach on 12/21/22.
//

import Foundation

struct DogItem: Codable {
    var image: URL
    
    enum CodingKeys: String, CodingKey {
        case image = "message"
    }    
}
