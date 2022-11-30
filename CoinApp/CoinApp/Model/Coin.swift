//
//  Coin.swift
//  CoinApp
//
//  Created by Furkan on 30.11.2022.
//

import Foundation


// MARK: - CoinElement
struct CoinElement: Codable {
    let id, symbol, name: String?
    let image: String?
    let currentPrice, priceChangePercentage24H: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
}

typealias Coin = [CoinElement]
