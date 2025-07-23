//
//  UIView+Gradient.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

extension UIView {
    
    /// <#Description#>
    /// - Parameters:
    ///   - gradient: <#gradient description#>
    ///   - locations: <#locations description#>
    ///   - startPoint: <#startPoint description#>
    ///   - endPoint: <#endPoint description#>
    /// - Returns: <#description#>
    func apply(
        _ gradient: [CGColor],
        locations: [NSNumber] = [0.5, 0.7],
        startPoint: CGPoint = CGPoint(x: 0, y: 1),
        endPoint: CGPoint = CGPoint(x: 1, y: 0)
    ) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = gradient
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
