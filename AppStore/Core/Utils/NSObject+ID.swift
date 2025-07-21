//
//  NSObject+ID.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

extension NSObject {
    
    /// <#Description#>
    static var id: String {
        NSStringFromClass(Self.self)
            .components(separatedBy: ".")
            .last!
    }
}
