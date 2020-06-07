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

        // Compnents
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        _ = Calendar.current.date(from: components) ?? Date()
        
        // let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
        // let hour = components.hour ?? 0
        // let minute = components.minute ?? 0
        
        // Formater
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        _ = formatter.string(from: Date())

        
        return DatePicker("Please enter a date",
                   selection: $wakeUp,
                   displayedComponents: .hourAndMinute)
//                   in: Date()...)
        
            .labelsHidden()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
