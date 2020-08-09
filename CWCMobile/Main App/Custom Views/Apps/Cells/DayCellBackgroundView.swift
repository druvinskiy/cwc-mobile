//
//  DayCellBackgroundView.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/26/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class DayCellBackgroundView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 8
        layer.shadowOffset = .init(width: 5, height: 5)
        layer.shouldRasterize = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
