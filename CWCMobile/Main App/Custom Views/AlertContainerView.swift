//
//  AlertContainerView.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/16/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AlertContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    private func configure() {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
