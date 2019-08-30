//
//  Config.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

struct Config {
    
    enum ConfigKey: String {
        case baseURL
        case apiExtension
        case apiKey
    }
    
    static var localConfig: [String: String] {
        if let path = Bundle.init(for: Constant.self).path(forResource: "config", ofType: "plist") {
            if let data = NSDictionary(contentsOfFile: path) as? [String: String] {
                return data
            }
        }

        return [:]
    }
    
    static func configValue(for key: ConfigKey) -> String {
        return Config.localConfig[key.rawValue] ?? ""
    }
}
