//
//  AppDisplayInfoView.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

final class AppDisplayInfoView: CoreView {

    let iconImageView = UIImageView()
    private let labelStackView = UIStackView()
    private let appTypeLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    let downloadButton = DownloadButton()
    private let inAppPurchaseLabel = UILabel()

    /// 앱이 Apple Arcade 앱인지 일반 앱인지에 따라 표시되는 라벨의 색상입니다.
    /// - Warning: `configure(with:)` 메서드 호출 시 이 값이 덮어씌워질 수 있습니다.
    var appTypeColor: UIColor = .whiteWithAlpha50 {
        didSet { appTypeLabel.textColor = appTypeColor }
    }

    /// 타이틀 라벨에 적용되는 색상입니다.
    /// - Warning: `configure(with:)` 메서드 호출 시 이 값이 덮어씌워질 수 있습니다.
    var titleColor: UIColor = .white {
        didSet { titleLabel.textColor = titleColor }
    }

    /// 서브타이틀 라벨에 적용되는 색상입니다.
    /// - Warning: `configure(with:)` 메서드 호출 시 이 값이 덮어씌워질 수 있습니다.
    var subtitleColor: UIColor = .whiteWithAlpha50 {
        didSet { subtitleLabel.textColor = subtitleColor }
    }

    /// 서브타이틀 라벨에 적용되는 글꼴 크기입니다.
    /// - Warning: `configure(with:)` 메서드 호출 시 이 값이 덮어씌워질 수 있습니다.
    var subtitleFontSize: CGFloat = 12.5 {
        didSet { subtitleLabel.font = .systemFont(ofSize: subtitleFontSize) }
    }

    /// 인앱 구매 라벨에 적용되는 색상입니다.
    /// - Warning: `configure(with:)` 메서드 호출 시 이 값이 덮어씌워질 수 있습니다.
    var inAppPurchaseColor: UIColor = .blackWithAlpha50 {
        didSet { inAppPurchaseLabel.textColor = inAppPurchaseColor }
    }

    /// 타이틀과 서브타이틀 라벨 사이의 간격입니다.
    /// - Warning: `configure(with:)` 메서드 호출 시 이 값이 덮어씌워질 수 있습니다.
    var spacingBetweenLabels: CGFloat = 0 {
        didSet { labelStackView.spacing = spacingBetweenLabels }
    }

    override func setupHierarchy() {
        addSubview(iconImageView)
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(subtitleLabel)
        addSubview(downloadButton)
        addSubview(inAppPurchaseLabel)
    }

    override func setupAutoLayout() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])

        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            labelStackView.heightAnchor.constraint(lessThanOrEqualTo: iconImageView.heightAnchor, multiplier: 1.1),
            labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: downloadButton.leadingAnchor, constant: -10)
        ])

        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            downloadButton.widthAnchor.constraint(equalToConstant: 80),
            downloadButton.heightAnchor.constraint(equalToConstant: 32),
            downloadButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            downloadButton.leadingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: 12)
        ])

        inAppPurchaseLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inAppPurchaseLabel.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 4),
            inAppPurchaseLabel.centerXAnchor.constraint(equalTo: downloadButton.centerXAnchor)
        ])

        appTypeLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }

    override func setupAttribute() {
        backgroundColor = .clear

        iconImageView.layer.cornerRadius = 14
        iconImageView.layer.cornerCurve = .continuous
        iconImageView.layer.masksToBounds = true
        iconImageView.backgroundColor = .systemGray5

        labelStackView.axis = .vertical
        labelStackView.spacing = 0
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill

        appTypeLabel.text = "Apple Arcade"
        appTypeLabel.font = .systemFont(ofSize: 13, weight: .regular)
        appTypeLabel.textColor = .systemGray3.withAlphaComponent(0.9)

        titleLabel.text = "Angry Birds Bounce"
        titleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2

        subtitleLabel.text = "소모임, 챌린지, 스터디, 취미 모임"
        subtitleLabel.font = .systemFont(ofSize: 12.5, weight: .regular)
        subtitleLabel.textColor = .systemGray3.withAlphaComponent(0.9)
        subtitleLabel.numberOfLines = 0

        inAppPurchaseLabel.text = "앱 내 구입"
        inAppPurchaseLabel.isHidden = true
        inAppPurchaseLabel.font = .systemFont(ofSize: 9, weight: .regular)
    }
}

extension AppDisplayInfoView {
    
    /// 주어진 모델을 기반으로 앱 정보를 뷰에 구성합니다.
    ///
    /// - Parameter model: 화면에 표시할 앱 정보 모델입니다.
    /// - Warning: 일반 프로퍼티들의 값을 미리 설정해두었더라도, 이 메서드를 호출하면 해당 값들이 덮어씌워질 수 있습니다.
    ///            특정 스타일 값을 예외적으로 적용하고 싶다면, 먼저 `configure(with:)` 메서드를 호출한 이후에 개별 프로퍼티 값을 수정하세요.
    func configre(with model: AppDisplayInfo) {
        if let type = model.type?.rawValue {
            appTypeLabel.text = type
            appTypeLabel.textColor = model.subtitleColor
            labelStackView.insertArrangedSubview(appTypeLabel, at: 0)
            labelStackView.spacing = 0
        }

        titleLabel.text = model.name
        titleLabel.textColor = model.nameColor
        subtitleLabel.text = model.subtitle
        subtitleLabel.textColor = model.subtitleColor

        inAppPurchaseLabel.isHidden = !model.hasInAppPurchase
        inAppPurchaseLabel.textColor = model.buttonBackgroundColor
    }

    func prepareForResue() {
        appTypeLabel.text = nil
        labelStackView.spacing = 0
        labelStackView.removeArrangedSubview(appTypeLabel)
        inAppPurchaseLabel.isHidden = true
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 100)) {
    let view = AppDisplayInfoView()
    view.titleColor = .black
    return view
}
