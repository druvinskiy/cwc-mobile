//
//  ImageSettingCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class ImageSettingCell: BaseSettingsCell {
    static let imageCellId = "imageCellId"
    
    var imageCellModel: ImageSetting! {
        didSet {
            textLabel?.text = imageCellModel.description
            imageView?.image = imageCellModel.image
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

class SocialSettingCell: ImageSettingCell {
    var socialCellModel: SocialSetting! {
        didSet {
            super.imageCellModel = socialCellModel
        }
    }
}
