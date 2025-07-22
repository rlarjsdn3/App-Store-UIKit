//
//  CoreCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

class CoreCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupAttribute()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
