//
//  AdvertisementCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class AdvertisementCollectionViewCell: CoreCollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var advertisementContenerView: UIView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        appIconImageView.layer.cornerRadius = 16
        appIconImageView.layer.cornerCurve = .continuous
        appIconImageView.layer.shadowColor = UIColor.black.cgColor
        appIconImageView.layer.shadowOpacity = 0.5
        appIconImageView.layer.shadowRadius = 2
        appIconImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        appIconImageView.layer.zPosition = 999

        advertisementContenerView.layer.cornerRadius = 6
        advertisementContenerView.layer.cornerCurve = .continuous

        gradientView.backgroundColor = .clear
        gradientView.apply(
            [UIColor.systemOrange.withAlphaComponent(0.7).cgColor,
             UIColor.systemOrange.withAlphaComponent(0.0).cgColor],
            locations: [0.45],
            startPoint: CGPoint(x: 0, y: 1),
            endPoint: CGPoint(x: 0, y: 0)
        )

        subTitleLabel.textColor = .systemGray4.withAlphaComponent(0.9)
    }
}

extension AdvertisementCollectionViewCell {

    func configure(with model: Advertisement) {
    }
}
