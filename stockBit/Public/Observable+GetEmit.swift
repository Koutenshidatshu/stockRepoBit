//
//  Observable+GetEmit.swift
//  stockBit
//
//  Created by Yonathan Wijaya on 12/11/20.
//

import Foundation
import RxSwift
import RxBlocking

extension Observable {
    func firstEmit() -> Element? {
        return try? toBlocking().first()
    }
    
    func allEmit() -> [Element]? {
        return try? toBlocking().toArray()
    }
}
