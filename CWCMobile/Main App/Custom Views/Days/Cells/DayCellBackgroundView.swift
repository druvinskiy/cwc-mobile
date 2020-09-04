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
        
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
