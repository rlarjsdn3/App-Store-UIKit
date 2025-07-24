//
//  UIImage+Resize.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

extension UIImage {

    /// 주어진 너비에 맞춰 이미지의 크기를 비율에 맞게 조정한 새 이미지를 반환합니다.
    ///
    /// 이미지의 가로(width)를 지정된 값으로 맞추고, 세로(height)는 원본 이미지의 종횡비(aspect ratio)를 유지하여 자동 계산됩니다.
    ///
    /// - Parameter width: 변경할 이미지의 너비입니다.
    /// - Returns: 크기가 조정된 새로운 `UIImage` 객체입니다.
    func resize(to width: CGFloat) -> UIImage {
        let ratio = width / size.width
        let height = size.height * ratio
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
