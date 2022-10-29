//
//  DayModel.swift
//  moneyspent
//
//  Created by Laurin Notemann on 13.10.22.
//

import Foundation

struct DayModel: Identifiable, Codable {
    var id: UUID = UUID()
    let date: Date
    var amount: Double
}
