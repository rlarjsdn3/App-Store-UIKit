//
//  UICollectionViewListCell+Configure.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

extension UICollectionViewListCell {
    
    /// 섹션 정보를 기반으로 셀의 콘텐츠를 구성합니다.
    ///
    /// `SectionDescriptor`의 타입에 따라 텍스트 및 서브텍스트의 내용, 스타일이 다르게 적용됩니다.
    /// `singleHeadline`, `dualHeadline`, `dualHeadlineReversed` 유형을 각각 구분하여 폰트와 색상을 적절히 설정합니다.
    ///
    /// - Parameter model: 셀에 표시할 섹션 정보를 담고 있는 모델입니다.
    func configure(with model: SectionDescriptor) {
        var content = self.defaultContentConfiguration()
        content.textProperties.font = .point26Bold
        content.textProperties.color = .label
        content.secondaryTextProperties.font = .point15Regular
        content.secondaryTextProperties.color = .secondaryLabel
        content.textToSecondaryTextVerticalPadding = 0
        content.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0)

        switch model.type {
        case .singleHeadline:
            content.text = model.title
        case .dualHeadline:
            content.text = model.title
            content.secondaryText = model.subtitle
        case .dualHeadlineReversed:
            content.text = model.subtitle
            content.textProperties.font = .point15Regular
            content.textProperties.color = .secondaryLabel
            content.secondaryText = model.title
            content.secondaryTextProperties.font = .point26Bold
            content.secondaryTextProperties.color = .label
        }

        self.contentConfiguration = content
    }
}

fileprivate extension UIFont {

    static let point26Bold: UIFont = {
        return UIFont.systemFont(ofSize: 22, weight: .bold)
    }()

    static let point15Regular: UIFont = {
        return UIFont.systemFont(ofSize: 15, weight: .regular)
    }()
}
