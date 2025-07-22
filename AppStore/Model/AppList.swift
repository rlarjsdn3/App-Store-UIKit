//
//  AppList.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

struct AppList {
    ///
    let sectionDescriptor: SectionDescriptor?
    ///
    let content: Content
}

extension AppList {

    struct Content {
        ///
        let appInfos: [AppInfo]
        ///
        let title: String
        ///
        let subTitle1: String
        ///
        let subTitle2: String?
    }
}

extension AppList: Hashable {
}
extension AppList.Content: Hashable {
}

extension AppList {

    // mock..
}
