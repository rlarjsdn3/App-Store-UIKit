//
//  AppInfo.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

struct AppInfo {
    ///
    let appIconImageResource: ImageResource
    ///
    var appIconImage: UIImage? {
        UIImage(resource: appIconImageResource)
    }

    let appType: AppType?
    ///
    let appName: String
    ///
    let appSubtitle: String
    ///
    let keywords: [String]
    ///
    let isDownloaded: Bool
}

extension AppInfo: Hashable {
}

extension AppInfo {

    enum AppType: String {
        case appleArcade = "Apple Arcade"
    }
}

extension AppInfo {

    // mock..
}
