//
//  Scripture.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

public struct Scripture: Decodable {
    enum BiblePartType: Int {
        case oldTestament
        case newTestament
        case unknown
        
        var description: String {
            switch self {
            case .oldTestament:
                return "Old Testament"
            case .newTestament:
                return "New Testament"
            case .unknown:
                return ""
            }
        }
    }
    
    var book = ""
    var bookNumber = 0
    var chapter = 0
    var verses = [""]
    var text = ""
    var textOriginal = ""
    var biblePart = 0
    var biblePartType: BiblePartType {
        return BiblePartType(rawValue: biblePart) ?? .unknown
    }
    var reference = ""
    var readingUrl = ""
    var readingURL: URL? {
        return URL(string: readingUrl)
    }
}
