//
//  RatioDescriptor.swift
//  AppStore
//
//  Created by 김건우 on 7/24/25.
//

import Foundation

struct RatioDescriptor: Hashable {
    let leftRatio: CGFloat
    let rightRatio: CGFloat
}

extension RatioDescriptor {

    static let zero: Self = .init(leftRatio: 0, rightRatio: 0)

    static let fourToSix: Self = .init(leftRatio: 0.4, rightRatio: 0.6)

    static let sixToFour: Self = .init(leftRatio: 0.6, rightRatio: 0.4)
}
