//
//  CoreCollectionReusableView.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

class CoreCollectionReusableView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()

        MainActor.assumeIsolated {
            setupHierarchy()
            setupAttribute()
            setupAutoLayout()
        }
    }

    /// 뷰 계층 구조를 구성합니다.
    /// 서브뷰를 `addSubview(_:)` 또는 `addArrangedSubview(_:)` 등을 통해 추가하는 역할을 담당합니다.
    func setupHierarchy() {
    }

    /// 뷰의 속성(스타일)을 설정합니다.
    /// 예: 배경색, 텍스트 속성, 폰트, cornerRadius 등 시각적 속성 설정에 사용됩니다.
    func setupAttribute() {
    }

    /// 오토레이아웃 제약 조건을 설정합니다.
    /// `NSLayoutConstraint`, `NSLayoutAnchor`, `SnapKit` 등을 통해 레이아웃을 정의합니다.
    func setupAutoLayout() {
    }
}
