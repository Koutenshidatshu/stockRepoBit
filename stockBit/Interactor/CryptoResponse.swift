//
//  CryptoResponse.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 12/11/20.
//

import Foundation
import RxSwift

struct CryptoRequester {
    enum RequestError : Error {
        case parse
    }
    
    let request: () -> Single<CryptoResponse>
}

extension CryptoRequester {
    init(requestApi: Observable<Data>) {
        request = {
            requestApi
                .map { try CryptoResponse.parse($0) }
                .take(1)
                .asSingle()
        }
    }
}

struct CryptoResponse : Decodable, Equatable {
    let blockChainData: [BlockChainData]
    
    enum CodingKeys: String, CodingKey {
        case blockChainData = "Data"
    }
}

struct BlockChainData: Decodable, Equatable {
    let coinInfo: CoinInfo
    let raw: Raw
    enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo"
        case raw = "RAW"
    }
}

struct CoinInfo: Decodable, Equatable {
    let id: String
    let name: String
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case fullName = "FullName"
    }
}

struct Raw: Decodable, Equatable {
    let usd: Usd

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

struct Usd: Decodable, Equatable {
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case price = "PRICE"
    }
}

private extension CryptoResponse {
    static func decode(from data: Data) throws -> CryptoResponse {
        let decoder = JSONDecoder()
        return try decoder.decode(CryptoResponse.self, from: data)
    }
    
    static func parse(_ jsonData: Data) throws -> CryptoResponse {
        do {
            return try decode(from: jsonData)
        } catch {
            throw CryptoRequester.RequestError.parse
        }
    }
}

