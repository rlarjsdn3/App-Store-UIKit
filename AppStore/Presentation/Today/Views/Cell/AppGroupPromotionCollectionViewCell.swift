//
//  AppGroupPromotionCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

final class AppGroupPromotionCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var iconImageViews: [UIImageView]!

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

extension AppGroupPromotionCollectionViewCell {
    
    /// 셀의 제목 및 부제목 레이블을 주어진 인기 항목 정보로 설정합니다.
    ///
    /// - Parameter model: 제목과 부제목을 포함하는 인기 항목(PopularTopList) 모델입니다.
    func configure(with model: PopularTopList) {
        subtitleLabel.text = model.subtitle
        titleLabel.text = model.title
    }
}
