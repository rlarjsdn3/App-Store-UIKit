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
        fatalError("init(coder:) has not been implemented")
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
