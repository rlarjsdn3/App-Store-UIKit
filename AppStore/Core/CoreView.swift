//
//  CoreView.swift
//  AppStore
//
//  Created by 김건우 on 7/22/25.
//

import UIKit

class CoreView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupAttribute()
        setupAutoLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHierarchy()
        setupAttribute()
        setupAutoLayout()
    }

    /// <#Description#>
    func setupHierarchy() {
    }

    /// <#Description#>
    func setupAttribute() {
    }

    /// <#Description#>
    func setupAutoLayout() {
    }
}
