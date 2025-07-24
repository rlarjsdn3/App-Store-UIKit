//
//  View+Apply.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

protocol Apply { }

extension Apply {

    /// 객체에 구성 작업(configuration)을 수행한 후, 해당 객체 자신을 반환합니다.
    ///
    /// 이 메서드는 체이닝 기반 구성 방식에 유용하며, 주로 뷰나 모델 객체를 간결하게 설정할 때 사용됩니다.
    ///
    /// - Parameter configurationHandler: 객체에 구성 작업을 적용하는 클로저입니다. `self`가 매개변수로 전달됩니다.
    /// - Returns: 구성 작업이 적용된 현재 객체(Self)를 반환합니다.
    func apply(configurationHandler: (Self) -> Void) -> Self {
        configurationHandler(self)
        return self
    }
}

extension NSObject: Apply { }
