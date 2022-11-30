//
//  CoinViewModel.swift
//  CoinApp
//
//  Created by Furkan on 30.11.2022.
//
import Foundation

class CoinViewModel : ObservableObject{
    @Published var coins : Coin?
    @Published var searchText = ""
    
    private var service : ICoinService
    
    var coinListWithFilter : Coin?{
        if searchText.isEmpty{
            return coins
        }else{
            let lowercasedQuery = searchText.lowercased()
            return coins?.filter({
                $0.name!.lowercased().contains(lowercasedQuery) ||
                $0.symbol!.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    init(service:ICoinService) {
        self.service = service
        self.fetchCoins()
    }
    
   
    func fetchCoins(){
        service.fetchCoins(path: .market) { coins in
            self.coins = coins
        }
    }
}
