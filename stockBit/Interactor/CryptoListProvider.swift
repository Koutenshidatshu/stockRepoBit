//
//  CryptoListProvider.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 12/11/20.
//

import Foundation
import RxSwift

protocol CryptoListProvider {
    func get() -> Observable<CryptoResponse>
}

struct CryptoListProviderImpl : CryptoListProvider{
    private let service: GetCryptoLists
    
    init(service: GetCryptoLists) {
        self.service = service
    }
    func get() -> Observable<CryptoResponse> {
        let requester = CryptoRequester(requestApi: service.get())
        return requester.request().asObservable()
    }
}
