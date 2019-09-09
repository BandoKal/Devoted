//
//  Mock.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation

extension AppEnvironment {
    static let mock = AppEnvironment(delegatedURLSession: .mock,
                                     apiEndpoint: .local)
}


class MockURLSession: URLSession {
    
    class MockURLSessionDataTask: URLSessionDataTask {
        var url: URL
        
        var completion: (Data?, URLResponse?, Error?) -> Void
        
        override func resume() {
            do {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                completion(data,response,error)
            } catch {
                completion(nil,response,error)
            }
        }
        
        init(_ url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
            self.url = url
            self.completion = completion
        }
    }
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask(url, completion: completionHandler)
    }
    
    func fetchVerses(from url: URL,
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

extension URLSession {
    static let mock = MockURLSession()
}
