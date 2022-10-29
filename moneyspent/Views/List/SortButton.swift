//
//  SortButton.swift
//  moneyspent
//
//  Created by Laurin Notemann on 16.10.22.
//

import SwiftUI

struct SortButton: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        Menu {
            Picker("Sort", selection: $vm.sortType) {
                ForEach(Sort.allCases, id: \.rawValue) { item in
                    Text(item.rawValue).tag(item)
                }
            }
            .onChange(of: vm.sortType) { _ in
                vm.newSort()
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease")
        }
    }
}

struct SortButton_Previews: PreviewProvider {
    static var previews: some View {
        SortButton(vm: ViewModel())
    }
}
