//
//  Help.swift
//  moneyspent
//
//  Created by Laurin Notemann on 15.10.22.
//

import Foundation

class Help {
    
    static func dateString(_ fromDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd.MM.yyyy / HH:mm"
        return dateFormatter.string(from: fromDate)
    }
    
    static func moneyString(_ money: Double) -> String {
        let moneyFormatter = NumberFormatter()
        moneyFormatter.numberStyle = .currency
        let nsMoney = NSNumber(value: money)
        return moneyFormatter.string(from: nsMoney) ?? "Error"
    }
    
    static func double(_ text: String) -> Double {
        Double(text.replacingOccurrences(of: ",", with: ".")) ?? 0
    }
}
