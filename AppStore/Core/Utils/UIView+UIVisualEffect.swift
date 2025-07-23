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
    func applyVisualEffect(style: UIBlurEffect.Style = .systemMaterialDark) {
        let blurEffect = UIBlurEffect(style: style)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = self.bounds
        self.addSubview(visualEffectView)
    }
}
