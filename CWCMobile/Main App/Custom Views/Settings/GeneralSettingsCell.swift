//
//  GeneralSettingsCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class GeneralSettingsCell: UITableViewCell {
    static let generalCellId = "generalCellId"
    
    var cellModel: GeneralSetting! {
        didSet {
            textLabel?.text = cellModel.description
        }
    }
}
