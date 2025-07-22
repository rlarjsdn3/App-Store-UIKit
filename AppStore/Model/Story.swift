//
//  Story.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

struct Story {
    ///
    let sectionDescriptor: SectionDescriptor?
    ///
    let content: Content
}

extension Story {

    struct Content {
        ///
        let title: String
        ///
        let subTitle1: String
        ///
        let subTitle2: String
        ///
        let appInfo: AppInfo
    }
}

extension Story: Hashable {
}
extension Story.Content: Hashable {
}

extension Story {

    // mock..
}
