//
//  UICollectionViewListCell+Configure.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

extension UICollectionViewListCell {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    func configure(with model: SectionDescriptor) {
        var content = self.defaultContentConfiguration()
        content.textProperties.font = .point26Bold
        content.textProperties.color = .label
        content.secondaryTextProperties.font = .body
        content.secondaryTextProperties.color = .secondaryLabel
        content.textToSecondaryTextVerticalPadding = 0
        content.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 16, trailing: 0)

        switch model.type {
        case .singleHeadline:
            content.text = model.title
        case .dualHeadline:
            content.text = model.title
            content.secondaryText = model.subtitle
        case .dualHeadlineReversed:
            content.text = model.subtitle
            content.textProperties.font = UIFont.preferredFont(forTextStyle: .callout)
            content.textProperties.color = .secondaryLabel
            content.secondaryText = model.title
            content.secondaryTextProperties.font = .point26Bold
            content.secondaryTextProperties.color = .label
        }

        self.contentConfiguration = content
    }
}

fileprivate extension UIFont {
    
    /// <#Description#>
    static let point26Bold: UIFont = {
        return UIFont.systemFont(ofSize: 26, weight: .bold)
    }()
    
    /// <#Description#>
    static let body: UIFont = {
        return UIFont.preferredFont(forTextStyle: .body)
    }()
}
