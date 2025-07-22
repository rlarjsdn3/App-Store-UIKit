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
        content.textProperties.font = .title1Bold
        content.textProperties.color = .label
        content.secondaryTextProperties.font = .title3
        content.secondaryTextProperties.color = .secondaryLabel

        switch model.type {
        case .singleHeadline:
            content.text = model.title
        case .dualHeadline:
            content.text = model.title
            content.secondaryText = model.subTitle
        case .dualHeadlineReversed:
            content.text = model.subTitle
            content.textProperties.font = .title3
            content.textProperties.color = .secondaryLabel
            content.secondaryText = model.title
            content.secondaryTextProperties.font = .title1Bold
            content.secondaryTextProperties.color = .label
        }

        self.contentConfiguration = content
    }
}

fileprivate extension UIFont {
    
    /// <#Description#>
    static let title1Bold: UIFont = {
        guard let descriptor = UIFontDescriptor
            .preferredFontDescriptor(withTextStyle: .title1)
            .withSymbolicTraits(.traitBold)
        else { return UIFont.preferredFont(forTextStyle: .title1) }
        return UIFont(descriptor: descriptor, size: 0)
    }()
    
    /// <#Description#>
    static let title3: UIFont = {
        return UIFont.preferredFont(forTextStyle: .title3)
    }()
}
