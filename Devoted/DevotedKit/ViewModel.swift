//
//  ViewModel.swift
//  DevotedKit
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct ViewModel {
    
    // Let's just do the last 5 days for now.
    func fetchLastFiveDays() {
        guard let fiveDaysAgo = Calendar.current.date(
        byAdding: .day,
        value: -5,
        to: Date()) else { return }
        
        let formatter = currentEnvironment.dateFormatter

        let fromDate = formatter.string(from: fiveDaysAgo)
        let toDate = formatter.string(from: Date())
        let url = buildURL(for: .bibleVerse, with: [URLQueryItem(name: Constant.fromDateAPIKey, value: fromDate),
                                                    URLQueryItem(name: Constant.toDateAPIKey, value: toDate)])


        fetchVerses(from: url) { result in
            switch result {
            case .success(let bibleVerses):
                //map to a model property
                print(bibleVerses)
            case .failure(let error):
                //map to a model property
                //Drop breadcrumb "Model updated with error"
                print(error)
            }
        }
    }
}

