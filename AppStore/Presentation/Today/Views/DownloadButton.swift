//
//  DownloadButton.swift
//  AppStore
//
//  Created by 김건우 on 7/23/25.
//

import UIKit

final class DownloadButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
    }
}

#Preview {
    DownloadButton()
}
