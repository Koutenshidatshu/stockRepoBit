//
//  NewsViewModel.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 15/11/20.
//

import Foundation
import RxSwift
import RxCocoa

class NewsViewModel {
    private let provider: NewsProvider
    lazy var news: Observable<[Article]> = newsRelay.asObservable()
    
    private var newsRelay = BehaviorRelay<[Article]>(value: [])
    private let disposeBag = DisposeBag()
    
    init(provider: NewsProvider) {
        self.provider = provider
    }
    
    func getNews() {
        provider.get()
            .subscribe(onNext: { [weak self] result in
                self?.newsRelay.accept(result.data)
            }).disposed(by: disposeBag)
    }
    
    func filterByCategory(name: String) {
        let filterNews = newsRelay.value.filter { $0.categories.lowercased().contains(name.lowercased())}
        newsRelay.accept(filterNews)
    }
    
    func itemAt(index: Int) -> Article {
        return newsRelay.value[index]
    }
    
    func newsCount() -> Int {
        return newsRelay.value.count
    }
    
}
struct NewsViewModelFactory {
    static func create() -> NewsViewModel {
        let provider = NewsProviderFactory.create()
        return NewsViewModel(provider: provider)
    }
}
