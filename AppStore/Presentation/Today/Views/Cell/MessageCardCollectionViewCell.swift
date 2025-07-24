//
//  MessageCardCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class MessageCardCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var primarySubtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondarySubtitleLabel: UILabel!

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        primarySubtitleLabel.textColor = .whiteWithAlpha50
        titleLabel.textColor = .white
        secondarySubtitleLabel.textColor = .whiteWithAlpha50
    }
}

extension MessageCardCollectionViewCell {
    
    /// 셀의 텍스트 레이블에 주어진 모델 데이터를 구성합니다.
    ///
    /// - Parameter model: 카테고리 카드 정보를 담고 있는 데이터 모델 객체로,
    ///   주요 제목, 부제목, 보조 부제목 등의 텍스트를 포함합니다.
    func configure(with model: CategoryCard) {
        primarySubtitleLabel.text = model.primarySubtitle
        titleLabel.text = model.title
        secondarySubtitleLabel.text = model.secondarySubtitle
    }
}
