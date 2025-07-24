//
//  StoryCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class StoryCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var labelStackView: UIStackView!
    private let primarySubtitleLabel = UILabel()
    @IBOutlet weak var titleLabel: UILabel!
    private let secondarySubtitleLabel = UILabel()

    @IBOutlet weak var transparentContainerView: UIView!
    @IBOutlet weak var appInfoView: AppDisplayInfoView!

    override func prepareForReuse() {
        super.prepareForReuse()
        primarySubtitleLabel.text = nil
        titleLabel.text = nil
        secondarySubtitleLabel.text = nil
        labelStackView.removeArrangedSubview(primarySubtitleLabel)
        labelStackView.removeArrangedSubview(secondarySubtitleLabel)
        appInfoView.prepareForResue()
    }

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        primarySubtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        primarySubtitleLabel.textColor = .whiteWithAlph50
        secondarySubtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        secondarySubtitleLabel.textColor = .whiteWithAlph50

        appInfoView.appTypeLabelColor = .whiteWithAlph50
        appInfoView.titleLabelColor = .white
        appInfoView.subtitleLabelColor = .whiteWithAlph50
        appInfoView.subtitleFontSize = 14
        appInfoView.titleToSubtitleSpacing = 2

        transparentContainerView.backgroundColor = .systemBackground.withAlphaComponent(0.1)
    }

}

extension StoryCollectionViewCell {

    func configure(with model: AppStory) {
        if let subtitle1 = model.primarySubtitle {
            primarySubtitleLabel.text = subtitle1
            primarySubtitleLabel.textColor = model.primarySubtitleColor
            labelStackView.insertArrangedSubview(primarySubtitleLabel, at: 0)
        }

        if let subtitle2 = model.secondaySubtitle {
            secondarySubtitleLabel.text = subtitle2
            secondarySubtitleLabel.textColor = model.secondarySubtitleColor
            labelStackView.addArrangedSubview(secondarySubtitleLabel)
        }

        titleLabel.text = model.title
        titleLabel.textColor = model.titleColor
        titleLabel.font = UIFont.systemFont(ofSize: model.titleFontSize, weight: .bold)
        appInfoView.titleToSubtitleSpacing = 2
        appInfoView.configre(with: model.appInfo)
        appInfoView.downloadButton.baseForegroundColor = model.appInfo.buttonTitleColor
        appInfoView.downloadButton.baseBackgroundColor = model.appInfo.buttonBackgroundColor
        appInfoView.downloadButton.highlightedBaseBackgroundColor = model.appInfo.buttonHighlightedBackgroundColor
        labelStackView.spacing = model.titleLineSpacing
    }
}
