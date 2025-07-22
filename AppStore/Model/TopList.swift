//
//  TopList.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

struct TopList {
    ///
    let sectionDescriptor: SectionDescriptor?
    ///
    let content: Content
}

extension TopList {

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

extension TopList: Hashable {
}
extension TopList.Content: Hashable {
}

extension TopList {

    // mock..
}
