//
//  ChangeButton.swift
//  moneyspent
//
//  Created by Laurin Notemann on 16.10.22.
//

import SwiftUI

struct ChangeButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm: ViewModel
    
    let day: DayModel
    
    @Binding var amount: Double
    
    var body: some View {
        Button {
            vm.changeAmout(from: day, to: amount)
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Change")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .disabled(amount == 0)
        .padding(2)
    }
}

struct ChangeButtin_Previews: PreviewProvider {
    static var previews: some View {
        ChangeButton(vm: ViewModel(), day: DayModel(date: Date(), amount: 0), amount: .constant(0))
    }
}
