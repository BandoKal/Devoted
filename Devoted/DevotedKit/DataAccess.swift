//
//  DataAccess.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

func buildURL(for endpoint: Endpoint, with params: [URLQueryItem] = []) -> URL {
    let fullAPIPath = endpoint.fullPath
    var comp = URLComponents(string: fullAPIPath)
    comp?.queryItems = [URLQueryItem(name: Constant.code, value: Config.configValue(for: .apiKey))]
    comp?.queryItems?.append(contentsOf: params)
    
    return comp?.url ?? URL(string: fullAPIPath)!
}


let jsonDecoder = JSONDecoder()

func decode<T: Decodable>(_ type: T.Type, from data: Data?) -> T? {
    guard let data = data else { return nil }
    return try! jsonDecoder.decode(type, from: data)
}


class NetworkFetcher {
    func fetchVerses(from url: URL,
                     completion: @escaping (Result<[String : [Scripture]], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let bibleVerses = decode([String: [Scripture]].self, from: data) else {
                if let error = error {
                    completion(.failure(.underlyingError(error)))
                } else {
                    completion(.failure(.noDataReturned))
                }
                return
            }
            completion(.success(bibleVerses))
        }.resume()
    }
}

