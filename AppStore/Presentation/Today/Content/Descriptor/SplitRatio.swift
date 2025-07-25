//
//  SplitRatio.swift
//  AppStore
//
//  Created by 김건우 on 7/24/25.
//

import Foundation

struct SplitRatio {
    @Clampled(range: 0.0...1.0) var left: CGFloat = 0.0
    @Clampled(range: 0.0...1.0) var right: CGFloat = 0.0

    init(left: CGFloat, right: CGFloat) {
        self.left = left
        self.right = right
    }
}

extension SplitRatio: Hashable {
    static func == (lhs: SplitRatio, rhs: SplitRatio) -> Bool {
        lhs.left == rhs.left && lhs.right == rhs.right
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(left)
        hasher.combine(right)
    }
}

extension SplitRatio {

    nonisolated(unsafe)
    static let zero: Self = .init(left: 0, right: 0)

    nonisolated(unsafe)
    static let fourToSix: Self = .init(left: 0.4, right: 0.6)

    nonisolated(unsafe)
    static let sixToFour: Self = .init(left: 0.6, right: 0.4)
}
