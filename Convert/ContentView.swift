//
//  ContentView.swift
//  Convert
//
//  Created by Игорь Верхов on 28.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fromConvert = 0
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter number", value: $fromConvert, format: .number)
                } header: {
                    Text("Enter measures")
                }
                .focused($amountIsFocused)
                .keyboardType(.decimalPad)
                
                
                Section {
                    
                } header: {
                    Text("Enter measures")
                }
                
                Section {
                    
                } header: {
                    Text("Enter measures")
                } .navigationTitle("Convert")
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                amountIsFocused = false
                            }
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
