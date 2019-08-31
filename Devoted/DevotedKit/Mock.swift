//
//  Mock.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

extension AppEnvironment {
    static let mock = AppEnvironment(apiEndpoint: .local,
                                     dataFetcher: .mock)
}


class MockNetworkFetcher: NetworkFetcher {
    override func fetchVerses(from url: URL,
                              completion: @escaping (Result<[String : [Scripture]], NetworkError>) -> Void) {
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            guard let bibleVerses = decode([String: [Scripture]].self, from: data) else {
                completion(.failure(.noDataReturned))
                return
            }
            completion(.success(bibleVerses))
        } catch {
            completion(.failure(.underlyingError(error)))
        }
    }
    
}

extension NetworkFetcher {
    static let mock = MockNetworkFetcher()
}
