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
        appDisplayInfoView.prepareForResue()
    }

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        subtitle1Label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        subtitle1Label.textColor = .whiteWithAlph50
        subtitle2Label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        subtitle2Label.textColor = .whiteWithAlph50

        appDisplayInfoView.appTypeLabelColor = .whiteWithAlph50
        appDisplayInfoView.titleLabelColor = .white
        appDisplayInfoView.subtitleLabelColor = .whiteWithAlph50
        appDisplayInfoView.subtitleFontSize = 14
        appDisplayInfoView.titleToSubtitleSpacing = 2

        bottomContainerView.backgroundColor = .systemBackground.withAlphaComponent(0.1)
    }

}

extension StoryCollectionViewCell {

    func configure(with model: AppStory) {
        if let subtitle1 = model.subTitle1 {
            subtitle1Label.text = subtitle1
            subtitle1Label.textColor = model.subTitle1Color
            labelStackView.insertArrangedSubview(subtitle1Label, at: 0)
        }

        if let subtitle2 = model.subTitle2 {
            subtitle2Label.text = subtitle2
            subtitle2Label.textColor = model.subTitle2Color
            labelStackView.addArrangedSubview(subtitle2Label)
        }

        titleLabel.text = model.title
        titleLabel.textColor = model.titleColor
        titleLabel.font = UIFont.systemFont(ofSize: model.titleSize, weight: .bold)
        appDisplayInfoView.titleToSubtitleSpacing = 2
        appDisplayInfoView.configre(with: model.appDisplayInfo)
        labelStackView.spacing = model.titleSpacing
    }
}
