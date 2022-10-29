//
//  ListItem.swift
//  moneyspent
//
//  Created by Laurin Notemann on 16.10.22.
//

import SwiftUI

struct ListDayView: View {
    
    @ObservedObject var vm: ViewModel
    
    let day: DayModel
    
    var body: some View {
        NavigationLink {
            SubView(vm: vm, day: day)
        } label: {
            VStack(alignment: .leading, spacing: 7) {
                Text(Help.moneyString(day.amount))
                    .font(.title2)
                Text(Help.dateString(day.date))
            }
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                ListDayView(vm: ViewModel(), day: DayModel(date: Date(), amount: 0))
            }
        }
    }
}
