//
//  ColorAppCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/19/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class ColorAppCell: BaseAppCell {
    
    static let colorCellId = "colorCellId"
    
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
