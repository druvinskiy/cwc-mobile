//
//  DayDetailHeaderView.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/11/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class DayDetailHeaderView: UICollectionReusableView {
    
    static let reuseId = "headerView"
    
    var title: UILabel  = {
        let label = UILabel(text: "", font: .boldSystemFont(ofSize: 20), numberOfLines: 0)
        label.textColor = .darkText
        return label
    }()
    
    var section: DayDetailSection! {
        didSet {
            title.text = section.title
            
            let items = section.cells
            
            if items.isEmpty {
                backgroundColor = Theme.chrisBlue
                title.textColor = .white
            } else {
                backgroundColor = (section.number % 2 == 0) ? Theme.rowLight : Theme.rowDark
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(title)
        title.centerYInSuperview()
        title.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
}
