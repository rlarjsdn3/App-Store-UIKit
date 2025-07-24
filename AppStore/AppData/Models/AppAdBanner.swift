//
//  AppAdBanner.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

/// 광고 정보를 나타내는 모델입니다.
struct AppAdBanner {

    /// 광고에 표시될 앱의 정보입니다.
    let appInfo: AppDisplayInfo

    /// 광고에 포함될 설명 텍스트입니다.
    let description: String
}

extension AppAdBanner: Hashable {
}

extension AppAdBanner {

    static let temuAdvertisement: Self = .init(
        appInfo: .temu,
        description: "역대급 할인 혜택을 Temu에서 만나보세요!"
    )
}
