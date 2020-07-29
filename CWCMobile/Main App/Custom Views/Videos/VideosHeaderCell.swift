//
//  VideosHeaderCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 7/25/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class VideosHeaderCell: UICollectionViewCell {
    
    var video: Video! {
        didSet {
            imageView.image = UIImage(named: video.videoThumbnail)
        }
    }
    
    let imageView = UIImageView(cornerRadius: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
