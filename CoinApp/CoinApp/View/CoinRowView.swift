//
//  CoinRowView.swift
//  CoinApp
//
//  Created by Furkan on 30.11.2022.
//

import SwiftUI
import Kingfisher
struct CoinRowView: View {
    let coin : CoinElement
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                KFImage(URL(string: coin.image!))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                    .padding(.horizontal)
                
                VStack(alignment: .leading){
                    Text(coin.symbol!.uppercased())
                        .font(.headline)
                    Text(coin.name!)
                        .font(.body)
                }
                Spacer()
                VStack{
                    Text(coin.currentPrice!.formatted())
                        .font(.headline)
                    Text(coin.priceChangePercentage24H!.formatted())
                        .font(.body)
                        .foregroundColor(Color(coin.priceChangePercentage24H! > 0 ? .green  : .red))
                }.padding(.horizontal)
            }
            
            Divider()
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {

    static var previews: some View {
       
        CoinRowView(coin: CoinElement(id: "bitcoin", symbol: "btc", name: "bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 16777.19, priceChangePercentage24H: 2.37675))
    }
}
