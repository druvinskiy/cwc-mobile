//
//  SettingsHeaderView.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class SettingsHeaderView: UIView {
    
    let title: UILabel  = {
        let label = UILabel(text: "", font: .boldSystemFont(ofSize: 20))
        label.textColor = .white
        return label
    }()
    
    init(settingsSection: SettingsSection) {
        title.text = settingsSection.title
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = Theme.chrisBlue
        
        addSubview(title)
        title.centerYInSuperview()
        title.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
    }
}
