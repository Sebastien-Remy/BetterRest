//
//  ContentView.swift
//  BetterRest
//
//  Created by Sebastien REMY on 07/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    var body: some View {
        Stepper(value: $sleepAmount, in: 4...12, step: 0.25 ) {
            Text("\(sleepAmount, specifier: "%.2f") hours")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
