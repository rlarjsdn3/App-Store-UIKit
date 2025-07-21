//
//  Card.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

struct Card {
    ///
    let sectionDescriptor: SectionDescriptor?
    ///
    let result: Result
}

extension Card {

    struct Result {
        ///
        let title: String
        ///
        let backgroundColor: UIColor
    }
}

extension Card: Hashable {
}
extension Card.Result: Hashable {
}

extension Card {

    // mock..
}
