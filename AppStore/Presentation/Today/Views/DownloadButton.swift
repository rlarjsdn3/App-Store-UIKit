//
//  DownloadButton.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

final class DownloadButton: UIButton {

    var baseForegroundColor: UIColor? {
        didSet { setupConfiguration() }
    }

    var baseBackgroundColor: UIColor? {
        didSet { setupConfiguration() }
    }

    var highlightedBaseBackgroundColor: UIColor? {
        didSet { setupConfiguration() }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConfiguration()
        setupUpdateHandler()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConfiguration()
        setupUpdateHandler()
    }
    
    private func setupConfiguration() {
        var attrContainer = AttributeContainer()
        attrContainer.font = .systemFont(ofSize: 17, weight: .bold)

        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = baseForegroundColor
        config.background.backgroundColor = baseBackgroundColor
        config.attributedTitle = AttributedString("받기", attributes: attrContainer)
        config.cornerStyle = .capsule
        self.configuration = config
    }

    private func setupUpdateHandler() {
        self.configurationUpdateHandler = { [weak self] button in
            var updatedConfig = button.configuration
            switch button.state {
            case .highlighted:
                updatedConfig?.background.backgroundColor = self?.highlightedBaseBackgroundColor
            default:
                updatedConfig?.background.backgroundColor = self?.baseBackgroundColor
            }
            button.configuration = updatedConfig
        }
    }
}

#Preview(traits: .fixedLayout(width: 100, height: 40)) {
    let button = DownloadButton()
    button.baseBackgroundColor = .blackWithAlpha10
    button.highlightedBaseBackgroundColor = .systemMint
    button.baseForegroundColor = .systemYellow
    return button
}
