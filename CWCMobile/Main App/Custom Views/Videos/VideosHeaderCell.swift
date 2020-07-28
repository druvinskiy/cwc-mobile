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
            titleLabel.text = video.title
            imageView.image = UIImage(named: video.videoThumbnail)
        }
    }
    
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24), numberOfLines: 2)
    let imageView: UIImageView = {
        let iv = UIImageView(cornerRadius: 16)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = VerticalStackView(arrangedSubviews: [
            titleLabel,
            imageView
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
        titleLabel.anchor(top: stackView.topAnchor, leading: stackView.leadingAnchor, bottom: nil, trailing: stackView.trailingAnchor)
        
        let imageViewHeight: CGFloat = DeviceTypes.isiPhoneSE2 || DeviceTypes.isiPhone8Zoomed ? 174 : 196
        
        imageView.anchor(top: nil, leading: stackView.leadingAnchor, bottom: stackView.bottomAnchor, trailing: stackView.trailingAnchor, size: .init(width: 0, height: imageViewHeight))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
