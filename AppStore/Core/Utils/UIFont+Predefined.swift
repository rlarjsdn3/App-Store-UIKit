//
//  UIFont+Predefined.swift
//  AppStore
//
//  Created by 김건우 on 7/25/25.
//

import UIKit

extension UIFont {

    static let point26Bold: UIFont = {
        return UIFont.systemFont(ofSize: 22, weight: .bold)
    }()

    static let point15Regular: UIFont = {
        return UIFont.systemFont(ofSize: 15, weight: .regular)
    }()
}
