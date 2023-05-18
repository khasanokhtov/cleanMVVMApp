//
//  ContentView.swift
//  CryptoCurrMVVM
//
//  Created by Alex Okhtov on 18.05.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Stepper("Amount: \(Int(vm.amount))€", value: $vm.amount, step: 100)
                    Slider(value: $vm.amount, in: 1...10_000)
                }
                .padding()
                
                List(vm.filteredRates) { item in
                    HStack {
                        Text(item.asset_id_quote)
                            .bold()
                        Spacer()
                        Text("\(vm.calculateRate(rate: item), specifier: "%.2f")")
                    }
                }
                .listStyle(.plain)
                .searchable(text: $vm.searchText)
            }
            .onAppear(perform: vm.fetchData)
            .navigationTitle("Cryptonic")
            .toolbar{
                ToolbarItem{
                    Button("Refresh", action: vm.fetchData)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
