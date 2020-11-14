//
//  GetNewsTests.swift
//  stockBitTests
//
//  Created by Yonathan Wijaya on 15/11/20.
//

import XCTest
@testable import stockBit

class GetNewsTests: XCTestCase {

    func testGetDatas() {
        let jsonString = createRequestString()

        let hasField = { (field: String, jsonString: String) in
            jsonString.contains(#""\#(field)""#)
        }
        
        XCTAssertTrue(hasField("Data" ,jsonString))

        let title = jsonString.contains("title")
        XCTAssertTrue(title)
        
        let body = jsonString.contains("body")
        XCTAssertTrue(body)

        let tags = jsonString.contains("tags")
        XCTAssertTrue(tags)
    }
    
       private func createRequestString() -> String {
           let data = GetNewsImpl().get().firstEmit()!
           return String(data: data, encoding: .utf8)!
       }
}
