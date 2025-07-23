//
//  TopListCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class TopListCollectionViewCell: CoreCollectionViewCell {

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

        appDispayInfoView.forEach {
            $0.titleLabelColor = .label
            $0.subtitleLabelColor = .secondaryLabel
        }
    }
}

extension TopListCollectionViewCell {

    func configure(with model: PopularTopList) {
        

        model.appInfos.enumerated().forEach { index, info in
            appDispayInfoView[safe: index]?.configre(with: info)
        }

    }
}
