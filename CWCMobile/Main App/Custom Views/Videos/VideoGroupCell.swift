//
//  VideoGroupCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 7/28/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class VideoGroupCell: UICollectionViewCell {
    
    let horizontalController = VideosHorizontalController()
    
    static let cellId = "videoGroupCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
