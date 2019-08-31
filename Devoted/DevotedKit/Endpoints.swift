//
//  Endpoints.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation


enum Endpoint: String {
    case bibleVerse = "bibleVerse-fx"
    case local = "ExampleScripture"
}

class BundleClass {}

extension Endpoint {
    var fullPath: String {
        switch self {
        case .bibleVerse:
            return Config.configValue(for: .baseURL) + Config.configValue(for: .apiExtension) + self.rawValue
        case .local:
            return Bundle.init(for: BundleClass.self).path(forResource: self.rawValue, ofType: "json") ?? ""
        }
    }
}
