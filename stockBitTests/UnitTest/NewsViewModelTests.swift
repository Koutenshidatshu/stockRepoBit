//
//  NewsViewModelTests.swift
//  stockBitTests
//
//  Created by Yonathan Wijaya on 15/11/20.
//

import XCTest
import RxSwift
@testable import stockBit

class NewsViewModelTests: XCTestCase {
    
    private var viewModel: NewsViewModel!
    private var providerMock : NewsProvider!
    private let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        providerMock = NewsProviderMock()
        
        viewModel = NewsViewModel(provider: providerMock)
        
    }
    
    func testGetNews() {
        var result = [Article]()
        
        viewModel.news
            .subscribe(onNext: { res in
                result = res
            }).disposed(by: disposeBag)
        
        viewModel.getNews()
        
        XCTAssertNotNil(result)
        XCTAssertGreaterThan(result.count, 1)
        XCTAssertEqual(viewModel.newsCount(), 19)
        
    }
    
    func testFilterNewsBasedOnCategory() {
        
        viewModel.news
            .subscribe(onNext: { _ in
            }).disposed(by: disposeBag)
        
        viewModel.getNews()
        viewModel.filterByCategory(name: "btc")
        
        XCTAssertEqual(viewModel.newsCount(), 7)
    }
    
}


class NewsProviderMock: NewsProvider {
    var sample = NewsApiMock().sample
    private var newsList: NewsResponse?
    
    func get() -> Observable<NewsResponse> {
        return .just(decodeToResponse(from: sample)!)
    }
    
    private func decodeToResponse(from jsonString: String) -> NewsResponse? {
        do {
            let data = Data(sample.utf8)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(NewsResponse.self, from: data)
        } catch {
            return nil
        }
        
    }
    
    func emit(news: NewsResponse) {
        newsList = news
    }
}
