//
//  NSObject+ID.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

extension NSObject {

    /// 클래스 이름을 문자열로 반환하는 정적 식별자입니다.
    ///
    /// 주로 셀이나 뷰의 `reuseIdentifier`, `Storyboard ID` 등으로 사용됩니다.
    /// 네임스페이스(모듈명 포함)를 제거하고 순수한 클래스 이름만 추출합니다.
    ///
    /// - Returns: 현재 클래스의 이름(String)
    static var id: String {
        NSStringFromClass(Self.self)
            .components(separatedBy: ".")
            .last!
    }
}
