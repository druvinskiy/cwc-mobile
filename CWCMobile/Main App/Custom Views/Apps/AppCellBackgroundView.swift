//
//  AppCellBackgroundView.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/19/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AppCellBackgroundView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.shadowColor = UserInterface.isDarkMode() ? UIColor.clear.cgColor : UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 5
        layer.shadowOffset = .init(width: 4, height: 4)
        layer.shouldRasterize = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
