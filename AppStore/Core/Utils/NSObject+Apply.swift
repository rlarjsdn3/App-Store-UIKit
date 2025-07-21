//
//  View+Apply.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import Foundation

protocol Apply { }

extension Apply {
    
    /// <#Description#>
    /// - Parameter configurationHandler: <#configurationHandler description#>
    /// - Returns: <#description#>
    func apply(configurationHandler: (Self) -> Void) -> Self {
        configurationHandler(self)
        return self
    }
}

extension NSObject: Apply { }
