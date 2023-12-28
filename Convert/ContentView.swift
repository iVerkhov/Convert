//
//  ContentView.swift
//  Convert
//
//  Created by Игорь Верхов on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fromConvert = 0.0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Celsius"
    
    @FocusState private var inputIsFocused: Bool
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    private var result: Double {
        switch (inputUnit, outputUnit) {
        case ("Celsius", "Fahrenheit"): return fromConvert * 1.8 + 32
        case ("Fahrenheit", "Celsius"): return (fromConvert - 32) / 1.8
        case ("Celsius", "Kelvin"):     return fromConvert + 273.15
        case ("Kelvin", "Celsius"):     return fromConvert - 273.15
        case ("Fahrenheit", "Kelvin"):  return (fromConvert + 459.67) * 5/9
        case ("Kelvin", "Fahrenheit"):  return fromConvert * 5/9 - 459.67
            
        default: return fromConvert
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter measures") {
                    TextField("Enter number", value: $fromConvert, format: .number)
                }
                .focused($inputIsFocused)
                .keyboardType(.decimalPad)
                
                Picker("Convert from:", selection: $inputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Section("Result in \(outputUnit)") {
                    Text(result.formatted())
                }
                
                Picker("Convert to:", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                .navigationTitle("Convert")
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                inputIsFocused = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
