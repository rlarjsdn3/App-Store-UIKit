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
    let result: Result
}

extension Advertisement {

    struct Result {
        ///
        let appInfo: AppInfo
        ///
        let backgroundColor: UIColor
    }
}

extension Advertisement: Hashable {
}
extension Advertisement.Result: Hashable {
}

extension Advertisement {

    // mock..
}
