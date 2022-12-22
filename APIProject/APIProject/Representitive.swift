//
//  Representitive.swift
//  APIProject
//
//  Created by Zach on 12/21/22.
//

import Foundation

struct Results: Codable {
    var results: [Rep]
}
struct Rep: Codable {
    let name: String
    var party: String
    var state: String
    var link: String
}
