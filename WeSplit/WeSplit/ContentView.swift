//
//  ContentView.swift
//  WeSplit
//
//  Created by Thy Nguyen on 8/20/21.
//  Instructed by Instructor: Paul Hudson
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = "" // user input
    @State private var numPersons = "" // user input
    
    // Default values
    @State private var numPeople = 2 // for picker
    @State private var tipPercent = 2 // indx of tipPercents array
    
    // Possible tips
    let tipPercents = [0, 10, 15, 20, 25]
    
    // Calculate the total tips per person
    // calculatedAmount: a computed property
    var calculatedAmount: [Double] {
        let peopleCount = Double(numPersons) ?? 1 //Double(numPeople + 2)
        let tipSelection = Double(tipPercents[tipPercent])
        let orderAmount = Double(checkAmount) ?? 0 // nil coalescing
        let totalTip = orderAmount * (tipSelection/100)
        let totalAmount = orderAmount + totalTip
        let amountPerPerson = totalAmount / peopleCount
        return [amountPerPerson, totalAmount]
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Your Check Amount", text: $checkAmount).keyboardType(.decimalPad) // show the digits 0 through 9 and optionally also the decimal point
                    
                   /* Picker("Number of people", selection: $numPeople) {
                            ForEach(2 ..< 100) {
                                Text("\($0) people")
                            }
                        // Note: $0 is a short-hand writing of "number in" in a closure
                        }
                    */
                    
                    TextField("Number of People", text: $numPersons).keyboardType(.numberPad)
                }
                
                Section(header: Text("Your tip percent")) {
                    Picker("Tip percentage", selection: $tipPercent) {
                        ForEach(0 ..< tipPercents.count) {
                            Text("\(self.tipPercents[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Amount")) {
                    Text("$\(calculatedAmount[1], specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(calculatedAmount[0], specifier: "%.2f")")
                }
                
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
