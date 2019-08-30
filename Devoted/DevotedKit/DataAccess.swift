//
//  DataAccess.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

enum Endpoint: String {
    case bibleVerse = "bibleVerse-fx"
}

func buildURL(for endpoint: Endpoint, with params: [URLQueryItem] = []) -> URL {
    let fullAPIPath = Config.configValue(for: .baseURL) + Config.configValue(for: .apiExtension) + endpoint.rawValue
    var comp = URLComponents(string: fullAPIPath)
    comp?.queryItems = [URLQueryItem(name: Constant.code, value: Config.configValue(for: .apiKey))]
    comp?.queryItems?.append(contentsOf: params)
    
    return comp?.url ?? URL(string: fullAPIPath)!
}


public func fetchVerses(from url: URL,
                        completion: @escaping (Result<[String: [Scripture]], NetworkError>) -> Void) {}
