//
//  RepresentitiveController.swift
//  APIProject
//
//  Created by Zach on 12/21/22.
//

import Foundation

class RepresentitiveController {
    var localRepInfo : [Rep] = []
    
    static func fetchRepresentitive(zipCode: [String: String]) async throws -> [Rep] {
        var urlCompenents = URLComponents(string: "https://whoismyrepresentative.com/getall_mems.php")
        urlCompenents?.queryItems = zipCode.map { URLQueryItem(name: $0.key, value: $0.value) }
        let (data, response) = try await URLSession.shared.data(from: (urlCompenents!.url!))
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw RepInfoError.itemNotFound
        }
        let jsonDecoder = JSONDecoder()
        let repInfo = try jsonDecoder.decode(Results.self, from: data)
        return repInfo.results
    }
    
    enum RepInfoError: Error, LocalizedError {
        case itemNotFound
    }
}
