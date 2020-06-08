//
//  ContentView.swift
//  BetterRest
//
//  Created by Sebastien REMY on 07/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeUptime
    @State private var sleepAmount = 8.0
    @State private var coffeeSelection = 1
     
    var coffeAmount: Int {
        return coffeeSelection - 1
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("When do you want to wake up?")){
                    DatePicker("Please select a tilme",
                               selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                Section(header: Text("Desire amount of sleep")){
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                Section (header: Text("Daily coffe intake")) {
                    Picker(selection: $coffeeSelection,
                           label: Text("Select coffe intake")) {
                            ForEach(1 ..< 20) {
                                if $0 == 1 {
                                    Text("1 cup")
                                } else {
                                    Text("\($0) cups")
                                }
                            }
                    }
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                }
                Section {
                    Text ("You may go to bed at: \(calculateBedTime)")
                        .font(.headline)
                        .listRowInsets(EdgeInsets())
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .foregroundColor(.white)
                }
                .background(Color.green.opacity(0.9))
            }
            .navigationBarTitle("Better Rest")
        }
    }
    
    static var defaultWakeUptime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var calculateBedTime: String {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute),
                                                  estimatedSleep: sleepAmount,
                                                  coffee: Double(coffeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            return formatter.string(from: sleepTime)
            }
        catch {
            return  "Sorry, prediction error"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
