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
    let result: Result
}

extension Story {

    struct Result {
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
extension Story.Result: Hashable {
}

extension Story {

    // mock..
}
