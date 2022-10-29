//
//  ListView.swift
//  moneyspent
//
//  Created by Laurin Notemann on 16.10.22.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        List {
            Section {
                ForEach(vm.days) { day in
                    ListDayView(vm: vm, day: day)
                }
                .onDelete{ i in
                    vm.del(i: i)
                }
            } footer: {
                footer
            }
        }
        .toolbar {
            EditButton()
        }
        .toolbar {
            Button {
                vm.addMoneySheet = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                SortButton(vm: vm)
            }
        }
    }
    
    var footer: some View {
        Text("Summe: \(Help.moneyString(vm.sum))")
            .font(.headline)
            .padding(.top, 5)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView(vm: ViewModel())
                .navigationTitle("Days")
        }
    }
}
