//
//  TermsOfUseCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/24/25.
//

import UIKit

final class TermsOfUseCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var changeRedeemCodeButton: UIButton!
    @IBOutlet weak var termsOfUseButton: UIButton!
    
    override func setupAttribute() {
        setupChangeRedeemCodeButtonConfiguration()
        setupTermsOfUseButtonConfiguration()
    }
    
    private func setupChangeRedeemCodeButtonConfiguration() {
        var attrContainer = AttributeContainer()
        attrContainer.font = .systemFont(ofSize: 17, weight: .semibold)
        
        var config = UIButton.Configuration.gray()
        config.attributedTitle = AttributedString("코드 교환", attributes: attrContainer)
        config.baseForegroundColor = .systemBlue
        config.background.cornerRadius = 12
        changeRedeemCodeButton.configuration = config
    }
    
    private func setupTermsOfUseButtonConfiguration() {
        var config = UIButton.Configuration.plain()
        config.title = "이용 약관"
        config.baseForegroundColor = .secondaryLabel
        config.image = UIImage(systemName: "chevron.forward")
        config.imagePadding = 5
        config.imagePlacement = .trailing
        config.preferredSymbolConfigurationForImage = .init(pointSize: 8)
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)
        
        termsOfUseButton.configuration = config
    }

}
