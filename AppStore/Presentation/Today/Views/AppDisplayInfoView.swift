//
//  AppDisplayInfoView.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

final class AppDisplayInfoView: CoreView {

    private let appIconImageView = UIImageView()
    private let labelStackView = UIStackView()
    private let appTypeLabel = UILabel()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let downloadButton = UIButton(type: .system)
    
    /// <#Description#>
    var appTypeLabelColor: UIColor = .whiteWithAlph50 {
        didSet { appTypeLabel.textColor = appTypeLabelColor }
    }

    /// <#Description#>
    var titleLabelColor: UIColor = .white {
        didSet { titleLabel.textColor = titleLabelColor }
    }
    
    /// <#Description#>
    var subtitleLabelColor: UIColor = .whiteWithAlph50 {
        didSet { subtitleLabel.textColor = subtitleLabelColor }
    }
    
    /// <#Description#>
    var subtitleFontSize: CGFloat = 16 {
        didSet { subtitleLabel.font = .systemFont(ofSize: subtitleFontSize) }
    }

    var titleToSubtitleSpacing: CGFloat = 0 {
        didSet { labelStackView.spacing = titleToSubtitleSpacing }
    }

    override func setupHierarchy() {
        addSubview(appIconImageView)
        addSubview(labelStackView)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(subtitleLabel)
        addSubview(downloadButton)
    }

    override func setupAutoLayout() {
        appIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appIconImageView.widthAnchor.constraint(equalToConstant: 58),
            appIconImageView.heightAnchor.constraint(equalToConstant: 58),
            appIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            appIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])

        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStackView.leadingAnchor.constraint(equalTo: appIconImageView.trailingAnchor, constant: 12),
            labelStackView.heightAnchor.constraint(lessThanOrEqualTo: appIconImageView.heightAnchor, multiplier: 1.1),
            labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: downloadButton.leadingAnchor, constant: -12)
        ])

        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            downloadButton.widthAnchor.constraint(equalToConstant: 70),
            downloadButton.heightAnchor.constraint(equalToConstant: 30),
            downloadButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            downloadButton.leadingAnchor.constraint(equalTo: labelStackView.trailingAnchor, constant: 12)
        ])

        appTypeLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }

    override func setupAttribute() {
        backgroundColor = .clear

        appIconImageView.layer.cornerRadius = 14
        appIconImageView.layer.cornerCurve = .continuous
        appIconImageView.backgroundColor = .systemGray5

        labelStackView.axis = .vertical
        labelStackView.spacing = 0
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill

        appTypeLabel.text = "Apple Arcade"
        appTypeLabel.font = .systemFont(ofSize: 15, weight: .regular)
        appTypeLabel.textColor = .systemGray3.withAlphaComponent(0.9)

        titleLabel.text = "Angry Birds Bounce"
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2

        subtitleLabel.text = "소모임, 챌린지, 스터디, 취미 모임"
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.textColor = .systemGray3.withAlphaComponent(0.9)
        subtitleLabel.numberOfLines = 0
    }
}

extension AppDisplayInfoView {

    func configre(with model: AppDisplayInfo) {
        if let type = model.appType?.rawValue {
            appTypeLabel.text = type
            appTypeLabel.textColor = model.appSubtitleColor
            labelStackView.insertArrangedSubview(appTypeLabel, at: 0)
            labelStackView.spacing = 0
        }

        titleLabel.text = model.appName
        titleLabel.textColor = model.appNameColor
        subtitleLabel.text = model.appSubtitle
        subtitleLabel.textColor = model.appSubtitleColor
    }

    func prepareForResue() {
        appTypeLabel.text = nil
        labelStackView.spacing = 0
        labelStackView.removeArrangedSubview(appTypeLabel)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 100)) {
    let view = AppDisplayInfoView()
    view.titleLabelColor = .black
    return view
}
