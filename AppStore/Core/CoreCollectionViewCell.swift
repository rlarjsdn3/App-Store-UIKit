//
//  CoreCollectionViewCell.swift
//  AppStore
//
//  Created by 김건우 on 7/21/25.
//

import UIKit

class CoreCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        MainActor.assumeIsolated {
            setupHierarchy()
            setupAttribute()
            setupAutoLayout()
        }
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
