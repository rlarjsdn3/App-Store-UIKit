//
//  BigCardCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class BigCardCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var primarySubtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondarySubtitleLabel: UILabel!

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        primarySubtitleLabel.textColor = .whiteWithAlph50
        titleLabel.textColor = .white
        secondarySubtitleLabel.textColor = .whiteWithAlph50
    }
}

extension BigCardCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    func configure(with model: CategoryCard) {
        primarySubtitleLabel.text = model.prumarySubtitle
        titleLabel.text = model.title
        secondarySubtitleLabel.text = model.secondarySubtitle
    }
}
