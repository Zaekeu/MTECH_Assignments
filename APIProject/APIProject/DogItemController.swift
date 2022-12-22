//
//  DogItemController.swift
//  APIProject
//
//  Created by Zach on 12/21/22.
//

import Foundation
import UIKit

enum DogItemError: Error, LocalizedError {
    case itemsNotFound
    case imageDataMissing
}

class DogItemController {
    func fetchDog() async throws -> DogItem {
        let urlComponents = URLComponents(string: "https://dog.ceo/api/breeds/image/random")
        
        if let url = urlComponents?.url {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw DogItemError.itemsNotFound
                }
                
                let decoder = JSONDecoder()
                return try decoder.decode(DogItem.self, from: data)
                
            } catch {
                print("Error")
                throw DogItemError.itemsNotFound
            }
        } else {
            throw DogItemError.itemsNotFound
        }
    }
    
    func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw DogItemError.itemsNotFound
        }
        guard let image = UIImage(data: data) else {
            throw DogItemError.imageDataMissing
        }
        return image
    }
}
