//
//  Array+SafeIndexing.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import Foundation

extension Array {

    ///
    subscript(safe index: Int) -> Element? {
        guard (0..<count) ~= index else { return nil }
        return self[index]
    }
}
