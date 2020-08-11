//
//  DayVideoCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/10/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class DayVideoCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var day: Day! {
        didSet {
            imageView.image = UIImage(named: "Play_Video_\(day.number)")
        }
    }
    
    static let videoCellId = "videoCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        addSubview(imageView)
        imageView.fillSuperview()
    }
}
