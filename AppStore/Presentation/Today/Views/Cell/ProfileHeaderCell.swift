//
//  ProfileHeaderCell.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

final class ProfileHeaderCell: CoreCollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    override func setupAttribute() {
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.layer.masksToBounds = true
        dateLabel.text = Date().formatted(
            .dateTime.month().day()
            .locale(Locale(identifier: "ko_KR"))
        )
    }
}
