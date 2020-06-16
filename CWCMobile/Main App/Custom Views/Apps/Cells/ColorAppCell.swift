//
//  ColorAppCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class ColorAppCell: BaseAppCell {
    
    var colorApp: ColorApp! {
        didSet {
            backgroundColor = colorApp.backgroundColor
            backgroundView?.backgroundColor = colorApp.backgroundColor
            super.app = colorApp
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
