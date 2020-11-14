//
//  CryptoListApi.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 12/11/20.
//

import Foundation

struct CryptoListApi {
    let path: String
    let news: String
    
    init() {
        path = "https://min-api.cryptocompare.com/data/top/totaltoptiervolfull?limit=50&tsym=USD"
        news = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN"
    }
}
