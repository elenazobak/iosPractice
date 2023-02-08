//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel)
    func didFailedWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = ""
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    var delegate = CoinManagerDelegate?.self
    
    
    func performRequest(with urlString: String) {
        //1. create a url
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in // getting the data from the url
                if error != nil {
                  //  delegate.didFailedWithError(error: error!)
                    return
                }
                
                if let safeData = data { // if data is not nil, it goes to safeData
                    var backToString = String(data: safeData, encoding: String.Encoding.utf8) as String?
                    print(backToString ?? "gg")
                   
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
}
