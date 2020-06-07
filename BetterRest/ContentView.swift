//
//  ContentView.swift
//  BetterRest
//
//  Created by Sebastien REMY on 07/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    
    var body: some View {
        DatePicker("Please enter a date",
                   selection: $wakeUp,
                   // displayedComponents: .hourAndMinute
                   in: Date()...)
            
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
