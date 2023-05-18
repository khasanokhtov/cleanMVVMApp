//
//  CryptoAPI-Manager.swift
//  CryptoCurrMVVM
//
//  Created by Alex Okhtov on 18.05.2023.
//

import Foundation

class CryptoAPI {
    let API_KEY = "660CCF16-B05A-4901-99B5-CCF1DB6DCF16"
    
    func getCryptoData(currency: String, previewMode: Bool, _ completion:@escaping ([Rate]) -> ()){
        if previewMode {
            completion(Rate.sampleRate)
            return
        }
        
        let urlString = "https://rest.coinapi.io/v1/exchangerate/\(currency)?invert=false&apikey=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
            print("Crypto API invalid")
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data else {
                print("Crypto API: Could not retrive data")
                return
            }
            
            do {
                let ratesData = try JSONDecoder().decode(Crypto.self, from: data)
                completion(ratesData.rates)
            } catch{
                print("Crypto API: \(error)")
                completion(Rate.sampleRate)
            }
        }
        .resume()
    }
}
