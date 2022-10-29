//
//  SubView.swift
//  moneyspent
//
//  Created by Laurin Notemann on 15.10.22.
//

import SwiftUI

struct SubView: View {
    
    @ObservedObject var vm: ViewModel
    
    @State private var amount: Double = 0
    @State private var date: Date = Date()
    
    let day: DayModel
    
    var body: some View {
        Form{
            DatePicker("Date", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.wheel)
                .labelsHidden()
            
            CurrencyTextField(preview: Help.moneyString(day.amount), amount: $amount)
            
            ChangeButton(vm: vm, day: day, amount: $amount)
                
        }
        .font(.title)
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(vm: ViewModel(), day: DayModel(date: Date(), amount: 0))
    }
}
