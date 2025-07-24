//
//  Advertisement.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

struct Advertisement {
    ///
    let appInfo: AppDisplayInfo
    ///
    let description: String
}

extension Advertisement: Hashable {
}

extension Advertisement {

    static let temuAdvertisement: Self = .init(
        appInfo: .temu,
        description: "역대급 할인 혜택을 Temu에서 만나보세요!"
    )
}
