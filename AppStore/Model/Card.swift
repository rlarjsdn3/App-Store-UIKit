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
    let result: Content
}

extension Card {

    struct Content {
        ///
        let title: String
    }
}

extension Card: Hashable {
}
extension Card.Content: Hashable {
}

extension Card {

    // mock..
}
