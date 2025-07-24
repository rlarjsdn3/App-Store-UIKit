//
//  UIColor+Predefined.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

extension UIColor {

    /// 투명도 90%의 흰색입니다. (주요 강조 색상에 사용)
    static var whiteWithAlpha90: UIColor {
        .white.withAlphaComponent(0.9)
    }

    /// 투명도 50%의 흰색입니다. (보조 텍스트나 서브타이틀 등에 사용)
    static var whiteWithAlpha50: UIColor {
        .white.withAlphaComponent(0.5)
    }

    /// 투명도 10%의 흰색입니다. (배경 강조나 투명 뷰에 사용)
    static var whiteWithAlpha10: UIColor {
        .white.withAlphaComponent(0.1)
    }

    /// 투명도 90%의 검정색입니다. (강조된 어두운 배경 등에 사용)
    static var blackWithAlpha90: UIColor {
        .black.withAlphaComponent(0.9)
    }

    /// 투명도 50%의 검정색입니다. (보조 텍스트나 어두운 서브뷰 등에 사용)
    static var blackWithAlpha50: UIColor {
        .black.withAlphaComponent(0.5)
    }

    /// 투명도 10%의 검정색입니다. (경계선, 그림자 등 미세한 강조에 사용)
    static var blackWithAlpha10: UIColor {
        .black.withAlphaComponent(0.1)
    }
}
