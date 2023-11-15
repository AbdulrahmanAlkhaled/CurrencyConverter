//
//  ContentView.swift
//  Currency
//
//  Created by ABDULRAHMAN AL-KHALED on 14/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var itemSelected = 0
    @State private var itemSelected2 = 1
    @State private var amount: String = ""
    private let currencies = ["SAR", "USD", "EUR"]
    
    func convert(_ convert: String)-> String{
        var conversion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency = currencies[itemSelected]
        let to = currencies[itemSelected2]
        
        let sar = ["USD": 0.27, "EUR": 0.25, "SAR": 1.0]
        let usd = ["USD": 1.0, "EUR": 0.92, "SAR": 3.75]
        let eur = ["USD": 1.09, "EUR": 1.0, "SAR": 4.08]
        
        switch(selectedCurrency){
        case "SAR":
            conversion = amount * (sar[to] ?? 0.0)
        case "USD":
            conversion = amount * (usd[to] ?? 0.0)
        case "EUR":
            conversion = amount * (eur[to] ?? 0.0)
        default:
            print("Something wrong!")
        }
        
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
            NavigationStack{
                Form{
                    Section(header: Text("select currency & amount")){
                        TextField("Enter an amount", text: $amount)
                            .keyboardType(.decimalPad)
                        
                        Picker(selection: $itemSelected, label: Text("From")){
                            ForEach(0 ..< currencies.count){ index in
                                Text(self.currencies[index]).tag(index)
                            }
                        }
                        
                        Picker(selection: $itemSelected2, label: Text("To")){
                            ForEach(0 ..< currencies.count){ index in
                                Text(self.currencies[index]).tag(index)
                            }
                        }
                    }
                    Section(header: Text("Conversion")){
                        Text("\(convert(amount)) \(currencies[itemSelected2])")
                    }
                }
                .navigationTitle("Currency Converter 💱")
            }
        }
    }

#Preview {
    ContentView()
}
