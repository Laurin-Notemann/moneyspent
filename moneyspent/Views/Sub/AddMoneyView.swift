//
//  AddMoneyView.swift
//  moneyspent
//
//  Created by Laurin Notemann on 15.10.22.
//

import SwiftUI

struct AddMoneyView: View {
    
    @ObservedObject var vm: ViewModel
    
    @State var amount: Double = 0
    @State var date: Date = Date()

    var body: some View {
        Form {
            Text("Choose Date:")
                .font(.title)
            
            DatePicker("Date", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.wheel)
                .labelsHidden()
            
            HStack {
                Text("Amount:")
                CurrencyTextField(amount: $amount)
            }
            .font(.title)
            
            Button {
                self.vm.save(date: date, amount: amount)
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .disabled(amount == 0)
        }
    }
}

struct AddMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        AddMoneyView(vm: ViewModel())
    }
}
