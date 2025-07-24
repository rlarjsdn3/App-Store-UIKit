//
//  UIView+UIVisualEffect.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

extension UIView {

    /// 지정한 스타일의 블러(blur) 효과를 현재 뷰에 적용합니다.
    ///
    /// 내부적으로 `UIVisualEffectView`를 생성하여 뷰의 크기에 맞춰 블러 효과를 덧씌웁니다.
    /// 뷰의 크기가 변경되더라도 효과가 따라가도록 자동 리사이징 마스크가 설정됩니다.
    ///
    /// - Parameter style: 블러 효과에 사용할 `UIBlurEffect.Style`입니다. 기본값은 `.systemChromeMaterialDark`입니다.
    func applyVisualEffect(style: UIBlurEffect.Style = .systemChromeMaterialDark) {
        let blurEffect = UIBlurEffect(style: style)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(visualEffectView, at: 0)
    }
}
