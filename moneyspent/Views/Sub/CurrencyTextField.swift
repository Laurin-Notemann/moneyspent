//
//  CurrencyTextField.swift
//  moneyspent
//
//  Created by Laurin Notemann on 16.10.22.
//

import SwiftUI

struct CurrencyTextField: View {
    
    @FocusState var amountTextFieldFocused: Bool
    
    var preview: String = "0"
    
    @Binding var amount: Double
    
    @State private var amountString: String = ""
    
    var body: some View {
        TextField(preview, text: $amountString)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
            .frame(width: 150, alignment: .center)
            .multilineTextAlignment(.trailing)
            .focused($amountTextFieldFocused)
            .onChange(of: amountString) { _ in
                amount = Help.double(amountString)
            }
            .onAppear {
                amountTextFieldFocused = true
            }
    }
}

struct CurrencyTextField_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyTextField(amount: .constant(0))
    }
}
