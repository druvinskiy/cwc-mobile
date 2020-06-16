//
//  StartPageCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class StartPageCell: PageCell {
    let startButton: UIButton = {
        let button = UIButton(title: "Start", cornerRadius: 10)
        
        button.backgroundColor = Theme.chrisBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        addSubview(startButton)
        
        startButton.anchor(top: descriptionTextView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 30, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
        startButton.centerXInSuperview()
    }
}
