//
//  CryptoViewModel.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 13/11/20.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel {
    private let provider: CryptoListProvider
    private let disposeBag = DisposeBag()
    
    lazy var coinList : Observable<[BlockChainData]> = coinListRelay.asObservable()
    private let coinListRelay = PublishRelay<[BlockChainData]>()
    private var blockChainList = [BlockChainData]()
    
    init(provider: CryptoListProvider) {
        self.provider = provider
    }
    
    func getCryptoList() {
        provider.get()
            .subscribe(onNext: {[weak self] result in
                self?.coinListRelay.accept(result.blockChainData)
                self?.blockChainList = result.blockChainData
            }).disposed(by: disposeBag)
    }
    
    func itemAt(index: Int) -> CoinInfo {
        return blockChainList[index].coinInfo
    }
    
    func coinCount() -> Int {
        return blockChainList.count
    }
}

struct CryptoViewModelFactory {
    static func create() -> CryptoViewModel {
        let provider = CryptoListProviderFactory.create()
        return CryptoViewModel(provider: provider)
    }
}
