//
//  UIView+UIVisualEffect.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

extension UIView {
    
    /// <#Description#>
    /// - Parameter style: <#style description#>
    func applyVisualEffect(style: UIBlurEffect.Style = .systemChromeMaterialDark) {
        let blurEffect = UIBlurEffect(style: style)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(visualEffectView)
    }
}
