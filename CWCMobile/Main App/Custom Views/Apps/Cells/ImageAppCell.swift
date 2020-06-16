//
//  ImageAppCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/26/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class ImageAppCell: BaseAppCell {
    var imageApp: ImageApp! {
        didSet {
            backgroundImageView.image = imageApp.backgroundImage
            super.app = imageApp
        }
    }
    
    let backgroundImageView = UIImageView(cornerRadius: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        insertSubview(backgroundImageView, at: 2)
        backgroundImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
