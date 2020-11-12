//
//  GetCryptoListTests.swift
//  stockBitTests
//
//  Created by Yonathan Wijaya on 12/11/20.
//

import XCTest
@testable import stockBit

class GetCryptoListTests: XCTestCase {

    func testGetDatas() {
        let jsonString = createRequestString()

        let hasField = { (field: String, jsonString: String) in
            jsonString.contains(#""\#(field)""#)
        }
        
        XCTAssertTrue(hasField("Data" ,jsonString))

        let name = jsonString.contains("Name")
        XCTAssertTrue(name)
        
        let fullName = jsonString.contains("FullName")
        XCTAssertTrue(fullName)

    }
    
    private func createRequestString() -> String {
        let data = GetCryptoListsImpl().get().firstEmit()!
        return String(data: data, encoding: .utf8)!
    }
}


