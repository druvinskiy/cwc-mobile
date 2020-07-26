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
    let titleLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 24))
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = Theme.chrisBlue
        
        let stackView = VerticalStackView(arrangedSubviews: [
            titleLabel,
            imageView
        ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
//        layer.cornerRadius = 16
        clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 198).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
