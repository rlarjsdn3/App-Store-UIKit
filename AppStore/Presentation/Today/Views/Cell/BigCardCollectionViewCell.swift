//
//  BigCardCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class BigCardCollectionViewCell: CoreCollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subTitle1Label: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitle2Label: UILabel!

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        subTitle1Label.textColor = .whiteWithAlph50
        titleLabel.textColor = .white
        subTitle2Label.textColor = .whiteWithAlph50
    }
}

extension BigCardCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    func configure(with model: CategoryCard) {
//        imageView.image = model.coverImage
        subTitle1Label.text = model.subTitle1 ?? ""
        titleLabel.text = model.title
        subTitle2Label.text = model.subTitle2 ?? ""
    }
}
