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

    enum CodingKeys: String, CodingKey {
            case coinInfo = "CoinInfo"
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

