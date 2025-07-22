//
//  NSObject+Nib.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

extension NSObject {
    
    /// <#Description#>
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: id, bundle: bundle)
    }
}
