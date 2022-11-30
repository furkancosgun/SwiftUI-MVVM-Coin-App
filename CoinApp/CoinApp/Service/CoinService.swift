//
//  CoinService.swift
//  CoinApp
//
//  Created by Furkan on 30.11.2022.
//

import Foundation
import Alamofire
//https://api.coingecko.com/api/v3/search/trending

protocol ICoinService{
    func fetchCoins(path:CoinPath,completion:@escaping(Coin)->Void)
}
class CoinService:ICoinService{
    private let baseUrl = "https://api.coingecko.com/api/v3/"
    
    func fetchCoins(path:CoinPath,completion:@escaping(Coin)->Void){
        print("Servis Çalıştı")
        AF.request(baseUrl+path.rawValue).responseDecodable(of: Coin.self) { response in
            print(response.error ?? "")
            guard let data = response.value else {return}
            print("Size: \(data.count)")
            completion(data)
        }
    }
}

enum CoinPath:String{
    case market = "coins/markets?vs_currency=USD&order=market_cap_desc&per_page=100&page=1&sparkline=false"
}
