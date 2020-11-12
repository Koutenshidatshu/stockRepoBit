//
//  CryptoListProviderTests.swift
//  stockBitTests
//
//  Created by Yonathan Wijaya on 12/11/20.
//

import XCTest
import RxSwift
@testable import stockBit

class CryptoListProviderTests: XCTestCase {
    func testGetSearchWithValidResponse() {
        let api = CryptoListApiMock()
        let provider = CryptoListProviderImpl(service: api).get()
        
        let result = provider.firstEmit()!.blockChainData
        XCTAssertNotNil(result)
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result.first?.coinInfo.name, "BTC")
        XCTAssertEqual(result.first?.coinInfo.fullName, "Bitcoin")
        XCTAssertEqual(result.last?.coinInfo.name, "ETH")
        XCTAssertEqual(result.last?.coinInfo.fullName, "Ethereum")
    }
}
