//
//  StoryCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class StoryCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var labelStackView: UIStackView!
    private let subtitle1Label = UILabel()
    @IBOutlet weak var titleLabel: UILabel!
    private let subtitle2Label = UILabel()

    @IBOutlet weak var bottomContainerView: UIView!
    @IBOutlet weak var appDisplayInfoView: AppDisplayInfoView!

    override func prepareForReuse() {
        super.prepareForReuse()
        subtitle1Label.text = nil
        titleLabel.text = nil
        subtitle2Label.text = nil
        labelStackView.removeArrangedSubview(subtitle1Label)
        labelStackView.removeArrangedSubview(subtitle2Label)
    }

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        subtitle1Label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        subtitle1Label.textColor = .systemGray3.withAlphaComponent(0.8)
        subtitle2Label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        subtitle2Label.textColor = .systemGray3.withAlphaComponent(0.8)

        bottomContainerView.backgroundColor = .systemBackground.withAlphaComponent(0.1)
    }

}

extension StoryCollectionViewCell {

    func configure(with model: AppStory) {
        if let subtitle1 = model.subTitle1 {
            subtitle1Label.text = subtitle1
            labelStackView.insertArrangedSubview(subtitle1Label, at: 0)
        }

        if let subtitle2 = model.subTitle2 {
            subtitle2Label.text = subtitle2
            labelStackView.addArrangedSubview(subtitle2Label)
        }

        titleLabel.text = model.title
//        titleLabel.textColor = model.titleColor
        appDisplayInfoView.configre(with: model.appDisplayInfo)
    }
}
