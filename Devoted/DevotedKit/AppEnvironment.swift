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

class AppEnvironment {
    let dateFormatter = makeDateFormatter(Constant.dateFormat)(DateFormatter())
}

let currentEnvironment = AppEnvironment()
