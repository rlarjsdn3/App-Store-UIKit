//
//  Array+SafeIndexing.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import Foundation

extension Array {

    /// 주어진 인덱스가 유효한 범위 내에 있는 경우 해당 요소를 반환하고, 그렇지 않으면 `nil`을 반환합니다.
    ///
    /// - Parameter index: 접근하려는 배열의 인덱스입니다.
    /// - Returns: 유효한 인덱스일 경우 해당 요소, 그렇지 않으면 `nil`을 반환합니다.
    subscript(safe index: Int) -> Element? {
        guard (0..<count) ~= index else { return nil }
        return self[index]
    }
}
