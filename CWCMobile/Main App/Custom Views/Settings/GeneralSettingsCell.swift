//
//  GeneralSettingsCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class GeneralSettingsCell: BaseSettingsCell {
    static let generalCellId = "generalCellId"
    
    var cellModel: GeneralSetting! {
        didSet {
            textLabel?.text = cellModel.description
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
