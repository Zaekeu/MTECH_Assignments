//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Zach on 12/21/22.
//

import Foundation

struct StoreItem: Codable {
    let artistName: String
    let kind: String
    let songTitle: String
    var description: String
    var url: URL
    

    
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case kind
        case songTitle = "trackName"
        case description = "longDescription"
        case url = "artworkUrl100"
       
        
    }
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        songTitle = try values.decode(String.self, forKey: CodingKeys.songTitle)
        artistName = try values.decode(String.self, forKey: CodingKeys.artistName)
        kind = try values.decode(String.self, forKey: CodingKeys.kind)
        url = try values.decode(URL.self, forKey: CodingKeys.url)
        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
         self.description = description
        } else {
         let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
         description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
       }
      }

struct SearchResponse: Codable {
    let results: [StoreItem]
}
