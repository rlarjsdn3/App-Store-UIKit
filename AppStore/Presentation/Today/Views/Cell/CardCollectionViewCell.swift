//
//  CardCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class CardCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}

extension CardCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    func configure(with model: CategoryCard) {
//        imageView.image = model.coverImage
        titleLabel.text = model.title
//        titleLabel.textColor = model.titleColor
    }
}
