//
//  TopListCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class TopListCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var appDispayInfoView: [AppDisplayInfoView]!

    override func setupAttribute() {
        layer.cornerRadius = 18
        layer.cornerCurve = .continuous
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 8
        layer.masksToBounds = false

        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true
    }
}

extension TopListCollectionViewCell {

    func configure(with model: PopularTopList) {
        subtitleLabel.text = model.subTitle
        titleLabel.text = model.title

        model.appInfos.enumerated().forEach { index, info in
            appDispayInfoView[safe: index]?.configre(with: info)
            appDispayInfoView[safe: index]?.titleLabelColor = .label
            appDispayInfoView[safe: index]?.subtitleLabelColor = .secondaryLabel
        }

    }
}
