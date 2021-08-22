//
//  ContentView.swift
//  UnitConversion
//
//  Created by Thy Nguyen on 8/21/21.
//

import SwiftUI

struct ContentView: View {
    // user input
    @State private var userUnitType = 0
    @State private var userInputUnit = 1
    @State private var userOutputUnit = 1
    @State private var input = ""
    
    
    var allChoices = ["Temperature", "Length", "Time", "Volume"]
    var smallerChoices = [
        "Temperature": ["Fahrenheit", "Celsius", "Kevin"],
        "Length": ["Meters", "Feet", "Inches"],
        "Time": ["Seconds", "Minutes", "Hours"],
        "Volume": ["Milliliters", "Liters", "Gallons"]
    ]
    
    // Calculated Property
    var result: Double {
        let idx = Int(userUnitType)
        let choice = allChoices[idx]
        let inChoice = smallerChoices[choice]![userInputUnit]
        let outChoice = smallerChoices[choice]![userOutputUnit]
        //var inProcess: Measurement<Unit>
        let temp: Double
        let tempInput = Double(input) ?? 0.0
        if choice == "Temperature" {
            if inChoice == "Celsius" {
                let inProcess = Measurement(value: tempInput, unit: UnitTemperature.celsius)
                temp = inProcess.converted(to: UnitTemperature.kelvin).value
            } else if inChoice == "Fahrenheit" {
                let inProcess = Measurement(value: tempInput, unit: UnitTemperature.fahrenheit)
                temp = inProcess.converted(to: UnitTemperature.kelvin).value
            } else {
                temp = tempInput
            }
            // Output
            if outChoice == "Celsius" {
                return temp - 273.15
            } else if outChoice == "Fahrenheit" {
                return (temp - 273.15) * (9/5)
            } else {
                return temp
            }
        } else if choice == "Length" {
            if inChoice == "Inches" {
                let inProcess = Measurement(value: tempInput, unit: UnitLength.inches)
                temp = inProcess.converted(to: UnitLength.meters).value
            } else if inChoice == "Feet" {
                let inProcess = Measurement(value: tempInput, unit: UnitLength.feet)
                temp = inProcess.converted(to: UnitLength.meters).value
            } else {
                temp = tempInput
            }
            
            // Output
            if outChoice == "Inches" {
                return temp * 39.37
            } else if outChoice == "Feet" {
                return temp * 3.281
            } else {
                return temp
            }
            
        }  else if choice == "Time" {
            if inChoice == "Minutes" {
                let inProcess = Measurement(value: tempInput, unit: UnitDuration.minutes)
                temp = inProcess.converted(to: UnitDuration.seconds).value
            } else if inChoice == "Hours" {
                let inProcess = Measurement(value: tempInput, unit: UnitDuration.hours)
                temp = inProcess.converted(to: UnitDuration.seconds).value
            } else {
                temp = tempInput
            }
            
            // Output
            if outChoice == "Minutes" {
                return temp / 60
            } else if outChoice == "Hours" {
                return temp / 3600
            } else {
                return temp
            }
            
        } else {
            if inChoice == "Milliliters" {
                let inProcess = Measurement(value: tempInput, unit: UnitVolume.milliliters)
                temp = inProcess.converted(to: UnitVolume.gallons).value
            } else if inChoice == "Liters" {
                let inProcess = Measurement(value: tempInput, unit: UnitVolume.liters)
                temp = inProcess.converted(to: UnitVolume.gallons).value
            } else {
                temp = tempInput
            }
            
            // Output
            if outChoice == "Milliliters" {
                return temp * 3785
            } else if outChoice == "Liters" {
                return temp * 3.785
            } else {
                return temp
        }
    }
}
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose your unit")) {
                    Picker("Unit Type", selection: $userUnitType) {
                        ForEach (0 ..< allChoices.count) {
                            Text("\(self.allChoices[$0])")
                        }
                    }
                }
                
                
                Section(header: Text("Your Input Unit")) {
                    Picker("Input Unit", selection: $userInputUnit) {
                        ForEach (0 ..< smallerChoices[allChoices[userUnitType]]!.count) {
                            Text("\(self.smallerChoices[allChoices[userUnitType]]![$0])")
                        }
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Section(header: Text("Your Output Unit")) {
                    Picker("Output Unit", selection: $userOutputUnit) {
                        ForEach (0 ..< smallerChoices[allChoices[userUnitType]]!.count) {
                            Text("\(self.smallerChoices[allChoices[userUnitType]]![$0])")
                        }
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Section(header: Text("Your Input")) {
                    TextField("Your Initial \(allChoices[userUnitType])", text: $input)
                }
                
                Section(header: Text("Your Output")) {
                    Text("Your Result is \(result, specifier: "%.2f") \(smallerChoices[allChoices[userUnitType]]![userOutputUnit])")
                }
                
            }.navigationBarTitle("UConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
