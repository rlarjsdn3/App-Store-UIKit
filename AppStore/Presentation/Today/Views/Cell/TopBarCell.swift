//
//  TopBarCell.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

final class TopBarCell: CoreCollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    override func setupAttribute() {
        dateLabel.text = Date().formatted(.dateTime.month().day())
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.layer.masksToBounds = true
    }
}
