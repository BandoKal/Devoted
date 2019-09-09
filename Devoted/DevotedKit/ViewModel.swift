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


final class ViewModel: ObservableObject {
    
    @Published var oldTestamentReference = ""
    @Published var oldTestamentDisplayText = ""
    var oldTestamentText = ""
    var oldTestamentOrginalText = ""
    
    @Published var newTestamentReference = ""
    @Published var newTestamentDisplayText = ""
    var newTestamentText = ""
    var newTestamentOrginalText = ""
    @Published var backgroundImage = ""
    @Published var fetchErrorMessage = ""
    
    func oldTestamentTextTapped() {
        oldTestamentDisplayText = (oldTestamentDisplayText == oldTestamentOrginalText) ?
            oldTestamentText :
            oldTestamentOrginalText
    }
    
    func newTestamentTextTapped() {
        newTestamentDisplayText = (newTestamentDisplayText == newTestamentOrginalText) ?
        newTestamentText :
        newTestamentOrginalText
    }
    
    func fetchTodaysVerse() {
        let formatter = currentEnvironment.dateFormatter(Constant.dateFormat)
        
        let fromDate = formatter.string(from: Date())
        let toDate = formatter.string(from: Date())
        let url = buildURL(for: currentEnvironment.apiEndpoint, with: [URLQueryItem(name: Constant.fromDateAPIKey, value: fromDate),
                                                                       URLQueryItem(name: Constant.toDateAPIKey, value: toDate)])
        
        let _ = fetchVerses(from: url)
            .assertNoFailure()
            .compactMap{ $0.data }
            .decode(type: [String: [Scripture]].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
            }) {
                let firstValue = $0.first?.value.first
                let secondValue = $0.first?.value[1]
            
                self.oldTestamentReference = firstValue?.reference ?? ""
                self.oldTestamentText = firstValue?.text ?? ""
                self.oldTestamentDisplayText = firstValue?.text ?? ""
                self.oldTestamentOrginalText = firstValue?.textOriginal ?? ""
                
                self.newTestamentReference = secondValue?.reference ?? ""
                self.newTestamentText = secondValue?.text ?? ""
                self.newTestamentDisplayText = secondValue?.text ?? ""
                self.newTestamentOrginalText = secondValue?.textOriginal ?? ""
        }
    }
    
    
}
