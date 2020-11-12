//
//  GetCryptoLists.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 12/11/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol GetCryptoLists {
    func get() -> Observable<Data>
}

class GetCryptoListsImpl: GetCryptoLists {
    
    func get() -> Observable<Data> {
        let session = URLSession.shared
        let data = session.rx.response(request: requestUrl())
            .map { (_, data) in
                return data
        }.retry(2)
        return handleApiRequestFailed(data)
    }
    
    private func requestUrl() -> URLRequest {
        let url = URL(string: CryptoListApi().path)!
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
    
    private func handleApiRequestFailed(_ observable: Observable<Data>) -> Observable<Data> {
        return observable.catchError { error -> Observable<Data> in
            if case let .httpRequestFailed(_, data)? = error as? RxCocoaURLError {
                return Observable.from(optional: data)
            } else {
                return .error(error)
            }
        }
    }
}
