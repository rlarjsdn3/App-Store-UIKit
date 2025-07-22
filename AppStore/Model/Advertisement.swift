//
//  Advertisement.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

struct Advertisement {
    ///
    let sectionDescriptor: SectionDescriptor?
    ///
    let content: Content
}

extension Advertisement {

    struct Content {
        ///
        let appInfo: AppInfo
        ///
        let description: String
    }
}

extension Advertisement: Hashable {
}
extension Advertisement.Content: Hashable {
}

extension Advertisement {

    // mock..
}
