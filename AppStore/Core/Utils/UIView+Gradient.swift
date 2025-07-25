//
//  UIView+Gradient.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

final class GradientView: UIView {

    private let gradientLayer = CAGradientLayer()

    init(
        colors: [CGColor],
        locations: [NSNumber]? = nil,
        startPoint: CGPoint,
        endPoint: CGPoint
    ) {
        super.init(frame: .zero)
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        layer.insertSublayer(gradientLayer, at: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

extension UIView {

    /// 지정된 색상 배열과 설정값으로 그라디언트 배경 뷰를 추가합니다.
    ///
    /// - Parameters:
    ///   - gradient: 적용할 색상 배열입니다. `CGColor` 타입으로, 최소 2개 이상의 색상을 포함해야 합니다.
    ///   - locations: 각 색상이 위치할 지점을 나타내는 배열입니다. 기본값은 `[0.5, 0.7]`입니다.
    ///   - startPoint: 그라디언트의 시작 지점입니다. 기본값은 `(0, 1)`입니다.
    ///   - endPoint: 그라디언트의 끝 지점입니다. 기본값은 `(1, 0)`입니다.
    func applyGradientBackground(
        colors: [CGColor],
        locations: [NSNumber] = [0.5, 0.7],
        startPoint: CGPoint = CGPoint(x: 0, y: 1),
        endPoint: CGPoint = CGPoint(x: 1, y: 0)
    ) {
        let gradientView = GradientView(
            colors: colors,
            locations: locations,
            startPoint: startPoint,
            endPoint: endPoint
        )
        backgroundColor = .clear
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(gradientView, at: 0)

        NSLayoutConstraint.activate([
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
