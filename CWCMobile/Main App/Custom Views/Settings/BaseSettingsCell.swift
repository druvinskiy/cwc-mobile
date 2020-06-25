//
//  BaseSettingsCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class BaseSettingsCell: UITableViewCell {
    
    fileprivate let cellFontSize: CGFloat = 18
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font = .systemFont(ofSize: cellFontSize)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
