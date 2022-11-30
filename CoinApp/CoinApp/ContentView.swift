//
//  ContentView.swift
//  CoinApp
//
//  Created by Furkan on 30.11.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel : CoinViewModel = CoinViewModel(service: CoinService())
    
    var body: some View {
        VStack {
            SearchBarView(text: $viewModel.searchText)
            ScrollView{
                LazyVStack(alignment: .center){
                    if let coins = viewModel.coinListWithFilter{
                        ForEach(coins,id: \.id) { coin in
                            CoinRowView(coin: coin)
                        }
                    }else{
                        ProgressView()
                        .foregroundColor(.black)
                    }
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
