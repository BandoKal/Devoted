//
//  AppEnvironment.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

func makeDateFormatter(_ format: String) -> (DateFormatter) -> DateFormatter {
    return { formatter in
        formatter.dateFormat = format
        return formatter
    }
}

struct AppEnvironment {
    var delegatedURLSession = URLSession.shared
    var apiEndpoint = Endpoint.bibleVerse
    let dateFormatter = { (dateFormat: String) in
        return makeDateFormatter(dateFormat)(DateFormatter())
    }
}

var currentEnvironment = AppEnvironment()
