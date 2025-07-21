//
//  UIImage+Resize.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

extension UIImage {
    
    /// <#Description#>
    /// - Parameter width: <#width description#>
    /// - Returns: <#description#>
    func resize(to width: CGFloat) -> UIImage {
        let ratio = width / size.width
        let height = size.height * ratio
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
