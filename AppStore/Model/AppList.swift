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
    let result: Result
}

extension AppList {

    struct Result {
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
extension AppList.Result: Hashable {
}

extension AppList {

    // mock..
}
