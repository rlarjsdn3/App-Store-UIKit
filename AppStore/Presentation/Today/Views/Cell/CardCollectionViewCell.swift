//
//  CardCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class CardCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true
    }
}

extension CardCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    func configure(with model: CategoryCard) {
        titleLabel.text = model.title
        titleLabel.textColor = model.titleColor
    }
}
