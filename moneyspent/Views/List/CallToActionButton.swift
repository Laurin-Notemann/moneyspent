//
//  ButtonView.swift
//  moneyspent
//
//  Created by Laurin Notemann on 16.10.22.
//

import SwiftUI

struct CallToActionButton: View {
    
    @Binding var addMoneySheet: Bool
    
    var body: some View {
        Button {
            addMoneySheet = true
        } label: {
            Text("ADD")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CallToActionButton(addMoneySheet: .constant(false))
    }
}
