//
//  SectionDescriptor.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

///
struct SectionDescriptor: Identifiable {
    ///
    let id: Int
    ///
    let title: String?
    ///
    let subTitle: String?
    ///
    let reversed: Bool = false
}

extension SectionDescriptor: Hashable {
    static func == (lhs: SectionDescriptor, rhs: SectionDescriptor) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
