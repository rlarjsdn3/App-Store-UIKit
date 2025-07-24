//
//  PromotionCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

final class PromotionCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet var iconImageViews: [UIImageView]!
    
    var iconImages: [UIImage?] {
        get { iconImageViews.map({ $0.image }) }
        set { setIconImages(newValue) }
    }
    
    private func setIconImages(_ images: [UIImage?]) {
        for (index, imageView) in iconImageViews.enumerated() {
            imageView.image = images[index]
        }
    }

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        iconImageViews.forEach {
            $0.layer.cornerRadius = 14
            $0.layer.cornerCurve = .continuous
        }

        subtitleLabel.textColor = .whiteWithAlpha90
    }
}

extension PromotionCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    func configure(with model: PopularTopList) {
        subtitleLabel.text = model.subtitle
        titleLabel.text = model.title
    }
}
