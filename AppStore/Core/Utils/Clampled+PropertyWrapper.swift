//
//  Clampled+PropertyWrapper.swift
//  AppStore
//
//  Created by 김건우 on 7/25/25.
//

import Foundation

@propertyWrapper
struct Clampled<Value> where Value: Comparable {
    private var value: Value
    private let range: ClosedRange<Value>

    var wrappedValue: Value {
        get { value }
        set { value = max(min(range.upperBound, newValue), range.lowerBound) }
    }

    init(wrappedValue: Value, range: ClosedRange<Value>) {
        self.value = wrappedValue
        self.range = range
    }
}
