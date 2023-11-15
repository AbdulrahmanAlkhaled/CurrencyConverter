//
//  Utilities.swift
//  Currency
//
//  Created by ABDULRAHMAN AL-KHALED on 14/11/2023.
//

import Foundation

extension String{
    
    static let numberFormatter = NumberFormatter()
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result = String.numberFormatter.number(from: self){
            return result.doubleValue
        }
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self){
                return result.doubleValue
        }
        return 0
    }
}
