//
//  Crypto-Model.swift
//  CryptoCurrMVVM
//
//  Created by Alex Okhtov on 18.05.2023.
//

import Foundation

struct  Crypto: Decodable{
    let asset_id_base: String
    let rates: [Rate]
}

struct Rate: Decodable, Identifiable{
    let id = UUID()
    let time: String
    let asset_id_quote: String
    let rate: Double
    
    static var sampleRate: [Rate] {
        var tempRates = [Rate]()
        
        for _ in 1...20{
            let randomNumber = Double(Array(0...1000).randomElement()!)
            let randomCurrency = ["BTC", "ETH", "LOL", "XRP", "WTF"].randomElement()!
            
            let sampleRate = Rate(time: "02342340", asset_id_quote: randomCurrency, rate: randomNumber)
            tempRates.insert(sampleRate, at: 0)
        }
        return tempRates
    }
}

