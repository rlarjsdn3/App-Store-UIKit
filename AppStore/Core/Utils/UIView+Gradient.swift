//
//  UIView+Gradient.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

extension UIView {

    /// 뷰의 배경에 지정된 색상 배열로 그라디언트 효과를 적용합니다.
    ///
    /// `CAGradientLayer`를 생성하여 현재 뷰의 `layer`에 삽입하며,
    /// 시작 지점과 끝 지점, 위치 값을 지정해 방향과 색상 분포를 제어할 수 있습니다.
    ///
    /// - Parameters:
    ///   - gradient: 적용할 색상 배열입니다. `CGColor` 타입으로, 최소 2개 이상의 색상을 포함해야 합니다.
    ///   - locations: 각 색상이 위치할 지점을 나타내는 배열입니다. 0.0 ~ 1.0 사이의 값으로 설정합니다. 기본값은 `[0.5, 0.7]`입니다.
    ///   - startPoint: 그라디언트의 시작 지점입니다. 기본값은 `(0, 1)`이며, 이는 왼쪽 하단을 의미합니다.
    ///   - endPoint: 그라디언트의 끝 지점입니다. 기본값은 `(1, 0)`이며, 이는 오른쪽 상단을 의미합니다.
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
