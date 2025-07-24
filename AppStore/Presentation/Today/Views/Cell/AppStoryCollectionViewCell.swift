//
//  AppStoryCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class AppStoryCollectionViewCell: CoreCollectionViewCell {

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

        primarySubtitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        primarySubtitleLabel.textColor = .whiteWithAlpha50
        
        secondarySubtitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        secondarySubtitleLabel.textColor = .whiteWithAlpha50

        appInfoView.appTypeColor = .whiteWithAlpha50
        appInfoView.titleColor = .white
        appInfoView.subtitleColor = .whiteWithAlpha50
        appInfoView.subtitleFontSize = 12.5
        appInfoView.spacingBetweenLabels = 2

        transparentContainerView.backgroundColor = .whiteWithAlpha10
    }

}

extension AppStoryCollectionViewCell {
    
    /// 셀의 콘텐츠를 주어진 앱 스토리 모델을 기반으로 구성합니다.
    ///
    /// - Parameter model: 앱 제목, 부제목, 앱 정보 및 스타일 속성을 포함하는 `AppStory` 모델입니다.
    ///   - `primarySubtitle`, `secondarySubtitle`: 각각 상단 및 하단 부제목 텍스트와 색상
    ///   - `title`: 제목 텍스트, 색상, 폰트 크기
    ///   - `appInfo`: 앱 이름, 서브타이틀, 버튼 색상 등 앱 정보를 담은 데이터
    ///   - `titleLineSpacing`: 텍스트 레이블 간의 간격
    func configure(with model: AppStory) {
        appInfoView.iconImageView.image = model.appInfo.iconImage

        if let subtitle1 = model.primarySubtitle {
            primarySubtitleLabel.text = subtitle1
            primarySubtitleLabel.textColor = model.primarySubtitleColor
            labelStackView.insertArrangedSubview(primarySubtitleLabel, at: 0)
        }

        if let subtitle2 = model.secondarySubtitle {
            secondarySubtitleLabel.text = subtitle2
            secondarySubtitleLabel.textColor = model.secondarySubtitleColor
            labelStackView.addArrangedSubview(secondarySubtitleLabel)
        }

        titleLabel.text = model.title
        titleLabel.textColor = model.titleColor
        titleLabel.font = UIFont.systemFont(ofSize: model.titleFontSize, weight: .bold)

        appInfoView.spacingBetweenLabels = 2
        appInfoView.configre(with: model.appInfo)
        appInfoView.downloadButton.baseForegroundColor = model.appInfo.buttonTitleColor
        appInfoView.downloadButton.baseBackgroundColor = model.appInfo.buttonBackgroundColor
        appInfoView.downloadButton.highlightedBackgroundColor = model.appInfo.buttonHighlightedBackgroundColor

        labelStackView.spacing = model.titleLineSpacing
    }
}
