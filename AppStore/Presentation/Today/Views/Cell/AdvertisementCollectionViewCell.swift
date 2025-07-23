//
//  AdvertisementCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

final class AdvertisementCollectionViewCell: CoreCollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var gradientView: UIView!
    
    override func setupAttribute() {
        imageView.layer.zPosition = 999
    }
}

extension AdvertisementCollectionViewCell {

    func configure(with model: Advertisement) {
    }
}
