//
//  CategoryCardColelctionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class CategoryCardColelctionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true
    }
}

extension CategoryCardColelctionViewCell {
    
    /// 셀의 제목 레이블을 주어진 모델 정보로 구성합니다.
    ///
    /// - Parameter model: 카드 제목 및 텍스트 색상을 포함한 카테고리 카드 모델입니다.
    func configure(with model: CategoryCard) {
        titleLabel.text = model.title
        titleLabel.textColor = model.titleColor
    }
}
