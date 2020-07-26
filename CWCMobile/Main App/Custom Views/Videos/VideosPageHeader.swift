//
//  VideosPageHeader.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 7/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class VideosPageHeader: UICollectionReusableView {
    
    let videosHeaderHorizontalController = VideosHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(videosHeaderHorizontalController.view)
        videosHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
