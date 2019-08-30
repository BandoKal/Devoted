//
//  Errors.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case noDataReturned
    case underlyingError(Error)
}
