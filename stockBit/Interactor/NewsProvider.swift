//
//  NewsProvider.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 15/11/20.
//

import Foundation
import RxSwift

protocol NewsProvider {
    func get() -> Observable<NewsResponse>
    
}
struct NewsProviderImpl: NewsProvider {
    private let service: GetNews
    
    init(service: GetNews) {
        self.service = service
    }
    
    func get() -> Observable<NewsResponse>{
        let requester = NewsRequester(requestApi: service.get())
        return requester.request().asObservable()
        
    }
}

struct NewsProviderFactory {
    static func create() -> NewsProvider {
        return NewsProviderImpl(service: GetNewsImpl())
    }
}
