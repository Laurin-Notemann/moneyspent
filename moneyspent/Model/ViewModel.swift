//
//  ViewModel.swift
//  moneyspent
//
//  Created by Laurin Notemann on 13.10.22.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var days: [DayModel] = []
    @Published var addMoneySheet: Bool = false
    
    @Published var sortType: Sort = .dateAscending
        
    var sum: Double {
        var b: Double = 0
        for day in days {
            b += day.amount
        }
        return b
    }
    
    init() {
        let defaults  = UserDefaults.standard
        if let savedDays =  defaults.object(forKey: "days") as? Data{
            let decoder = JSONDecoder()
            if let loadedDays = try? decoder.decode([DayModel].self, from: savedDays){
                days = loadedDays
            }
        }
    }
    
    func saveToDefaults() {
        let encoder = JSONEncoder()
        let defaults  = UserDefaults.standard
        if let encoded = try? encoder.encode(days){
            defaults.set(encoded, forKey: "days")
        }
    }
    
    func save(date: Date, amount: Double) {
        let day: DayModel = DayModel(date: date, amount: amount)
        addMoneySheet = false
        days.append(day)
        newSort()
        saveToDefaults()
    }
    
    func del(i: IndexSet) {
        days.remove(atOffsets: i)
        saveToDefaults()
    }
    
    func changeAmout(from day: DayModel, to amount: Double) {
        if let index = days.firstIndex(where: { $0.id == day.id }) {
            days[index].amount = amount
            saveToDefaults()
        }
    }
    
    func newSort() {
        switch sortType {
        case .amountAscending:
            days = days.sorted(by: { $0.amount < $1.amount })
        case .amountDescending:
            days = days.sorted(by: { $0.amount > $1.amount })
        case .dateAscending:
            days = days.sorted(by: { $0.date < $1.date })
        case .dateDescending:
            days = days.sorted(by: { $0.date > $1.date })
        }
    }
    
}


enum Sort: String, CaseIterable {
    case amountAscending
    case amountDescending
    case dateAscending
    case dateDescending
}
