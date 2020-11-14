
//
//  NewsProviderTests.swift
//  stockBitTests
//
//  Created by Yonathan Wijaya on 15/11/20.
//

import XCTest
import RxSwift
@testable import stockBit

class NewsProviderTests: XCTestCase {
    func testGetSearchWithValidResponse() {
        let api = NewsApiMock()
        let provider = NewsProviderImpl(service: api).get()
        
        let result = provider.firstEmit()!.data
        XCTAssertNotNil(result)
        XCTAssertEqual(result.count, 19)
        XCTAssertEqual(result.first?.body, "A skilled coder has just made $5 million worth of dai by flashloaning 80,000 eth, currently worth about $37 million. The return itself is substantial, more than 10%, but here...")
        XCTAssertEqual(result.first?.title, "Guy Makes $5 Million From an 80,000 Ethereum Flashloan")
        XCTAssertEqual(result.first?.categories, "ETH")
        XCTAssertEqual(result.first?.tags, "Ethereum|News|Smart Contracts")
    }
}
