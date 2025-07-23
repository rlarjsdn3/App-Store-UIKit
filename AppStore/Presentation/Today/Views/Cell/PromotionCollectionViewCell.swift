//
//  PromotionCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

final class PromotionCollectionViewCell: CoreCollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet var imageView: [UIImageView]!
    
    var iconImages: [UIImage?] {
        get { imageView.map({ $0.image }) }
        set { setIconImages(newValue) }
    }
    
    private func setIconImages(_ images: [UIImage?]) {
        for (index, imageView) in imageView.enumerated() {
            imageView.image = images[index]
        }
    }

    override func setupAttribute() {
        contentView.layer.cornerRadius = 18
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        imageView.forEach {
            $0.layer.cornerRadius = 14
            $0.layer.cornerCurve = .continuous
        }

        subTitleLabel.textColor = .whiteWithAlpha90
    }
}

extension PromotionCollectionViewCell {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    func configure(with model: PopularTopList) {
//        coverImageView.image = model.coverImage
        subTitleLabel.text = model.subTitle ?? ""
        titleLabel.text = model.title
//        iconImages = [model.appInfos[safe: 0]?.appIconImage,
//                      model.appInfos[safe: 1]?.appIconImage,
//                      model.appInfos[safe: 2]?.appIconImage,
//                      model.appInfos[safe: 3]?.appIconImage,
//                      model.appInfos[safe: 4]?.appIconImage]
    }
}
