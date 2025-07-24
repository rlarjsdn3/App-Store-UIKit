//
//  NSObject+Nib.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

@MainActor
extension NSObject {

    /// 클래스 이름과 동일한 이름의 XIB(Nib) 파일을 로드하여 반환합니다.
    ///
    /// - 주로 커스텀 뷰, 테이블/컬렉션 뷰 셀 등에서 Nib 파일을 쉽게 로드하기 위해 사용됩니다.
    /// - 내부적으로 클래스명을 기반으로 Nib 이름을 추정하며, `id` 프로퍼티를 통해 클래스 이름을 가져옵니다.
    ///
    /// - Returns: 현재 클래스와 이름이 동일한 Nib 파일로부터 생성된 `UINib` 객체입니다.
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: id, bundle: bundle)
    }
}
