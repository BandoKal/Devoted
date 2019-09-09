//
//  Views.swift
//  Devoted
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

public struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    // struct implicit init is set to internal scope
    public init() {}
    
    public var body: some View {
        
        NavigationView {
            VStack(alignment: .leading, spacing: 30.0) {
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("From the Old Testament").font(.headline)
                    Text($viewModel.oldTestamentReference.value).font(.subheadline)
                    Text($viewModel.oldTestamentDisplayText.value).font(.body).onTapGesture {
                        self.viewModel.oldTestamentTextTapped()
                    }
                }
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("From the New Testament").font(.headline)
                    Text($viewModel.newTestamentReference.value).font(.subheadline)
                    Text($viewModel.newTestamentDisplayText.value).font(.body).onTapGesture {
                        self.viewModel.newTestamentTextTapped()
                    }
                }
                Spacer()
            }.frame(maxWidth: .infinity)
                .navigationBarTitle("Verses for Today" , displayMode: .automatic)
                .background(Image("example-landscape", bundle: Bundle.main).blur(radius: 5.0))
        }
        .onAppear() {
            self.viewModel.fetchTodaysVerse()
        }
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
