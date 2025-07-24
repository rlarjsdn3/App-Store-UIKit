//
//  PopularTopListCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class PopularTopListCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var appInfoViews: [AppDisplayInfoView]!

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

extension PopularTopListCollectionViewCell {
    
    /// 셀의 제목, 부제목 및 앱 정보 뷰들을 주어진 인기 앱 리스트 모델로 구성합니다.
    ///
    /// - Parameter model: 인기 앱 리스트 정보인 `PopularTopList` 모델로,
    ///   제목, 부제목, 그리고 최대 3개의 앱 정보(`appInfos`)를 포함합니다.
    ///   각 앱 정보는 앱 이름, 부제목, 인앱 구매 여부, 버튼 색상 등으로 구성됩니다.
    func configure(with model: PopularTopList) {
        subtitleLabel.text = model.subtitle
        titleLabel.text = model.title

        model.appInfos.enumerated().forEach { index, info in
            appInfoViews[safe: index]?.configre(with: info)
            appInfoViews[safe: index]?.titleColor = .label
            appInfoViews[safe: index]?.subtitleColor = .secondaryLabel
            appInfoViews[safe: index]?.subtitleFontSize = 14
            appInfoViews[safe: index]?.inAppPurchaseColor = .secondaryLabel
            appInfoViews[safe: index]?.downloadButton.baseForegroundColor = .systemBlue
            appInfoViews[safe: index]?.downloadButton.baseBackgroundColor = .systemGray5
            appInfoViews[safe: index]?.downloadButton.highlightedBackgroundColor = .systemGray5.withAlphaComponent(0.5)
        }

    }
}
