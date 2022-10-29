//
//  ContentView.swift
//  moneyspent
//
//  Created by Laurin Notemann on 13.10.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm: ViewModel = ViewModel()
    
    var body: some View {
        ZStack {
            if vm.days.isEmpty {
                CallToActionButton(addMoneySheet: $vm.addMoneySheet)
            } else {
                ListView(vm: vm)
            }
        }
        .sheet(isPresented: $vm.addMoneySheet) {
            AddMoneyView(vm: vm)
        }
        .navigationTitle("Days")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}
