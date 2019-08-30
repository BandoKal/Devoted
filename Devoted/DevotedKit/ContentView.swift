//
//  ContentView.swift
//  Devoted
//
//  Created by JDU9706 on 8/30/19.
//  Copyright © 2019 bandokal. All rights reserved.
//

import SwiftUI

public struct ContentView: View {
    
    // struct implicit init is set to internal scope
    public init() {}
    
    public var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
