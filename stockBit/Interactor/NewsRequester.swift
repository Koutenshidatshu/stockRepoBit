//
//  NewsRequester.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 15/11/20.
//

import Foundation
import RxSwift

struct NewsRequester {
    enum RequestError : Error {
        case parse
    }
    let request: () -> Single<NewsResponse>
}

extension NewsRequester {
    init(requestApi: Observable<Data>) {
        request = {
            requestApi
                .map { try NewsResponse.parse($0) }
                .take(1)
                .asSingle()
        }
    }
}

struct NewsResponse : Decodable, Equatable {
    let data: [Article]
    
    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
}

struct Article: Decodable, Equatable {
    let title: String
    let body: String
    let categories: String
    let tags: String
    
}

private extension NewsResponse {
    static func decode(from data: Data) throws -> NewsResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(NewsResponse.self, from: data)
    }
    
    static func parse(_ jsonData: Data) throws -> NewsResponse {
        do {
            return try decode(from: jsonData)
        } catch {
            throw NewsRequester.RequestError.parse
        }
    }
}

