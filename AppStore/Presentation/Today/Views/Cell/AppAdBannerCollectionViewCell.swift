//
//  AppAdBannerCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class AppAdBannerCollectionViewCell: CoreCollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descContainerView: UIView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var downloadButton: DownloadButton!

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        iconImageView.layer.cornerRadius = 16
        iconImageView.layer.cornerCurve = .continuous
        iconImageView.layer.shadowColor = UIColor.black.cgColor
        iconImageView.layer.shadowOpacity = 0.5
        iconImageView.layer.shadowRadius = 2
        iconImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        iconImageView.layer.zPosition = 999

        descContainerView.layer.cornerRadius = 6
        descContainerView.layer.cornerCurve = .continuous
        gradientView.applyGradientBackground(
            colors: [UIColor.systemOrange.withAlphaComponent(0.7).cgColor,
             UIColor.systemOrange.withAlphaComponent(0.0).cgColor],
            locations: [0.45],
            startPoint: CGPoint(x: 0, y: 1),
            endPoint: CGPoint(x: 0, y: 0)
        )

        subtitleLabel.textColor = .whiteWithAlpha50

        downloadButton.baseForegroundColor = .white
        downloadButton.baseBackgroundColor = .whiteWithAlpha50
        downloadButton.highlightedBackgroundColor = .blackWithAlpha10
    }
}

extension AppAdBannerCollectionViewCell {

    func configure(with model: AppAdBanner) {
        iconImageView.image = model.appInfo.iconImage
        titleLabel.text = model.appInfo.name
        subtitleLabel.text = model.description
    }
}
