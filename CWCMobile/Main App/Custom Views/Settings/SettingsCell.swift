//
//  SettingsCell.swift
//  SettingsTemplate
//
//  Created by Stephen Dowless on 2/10/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

protocol SwitchSettingsCellDelegate: AnyObject {
    func handleSwitchAction(item: GeneralItem)
}

class SettingsCell: UITableViewCell {
    static let generalSettingsCellId = "generalSettingsCellId"
    
    var cellModel: GeneralSetting! {
        didSet {
            textLabel?.text = cellModel.description
        }
    }
}

class SwitchSettingsCell: UITableViewCell {
    weak var delegate: SwitchSettingsCellDelegate?
    static let switchSettingsCellId = "switchSettingsCellId"
    
    var cellModel: SwitchSetting! {
        didSet {
            textLabel?.text = cellModel.description
            switchControl.isOn = cellModel.isOn
        }
    }
    
    lazy var switchControl: UISwitch = {
        let sc = UISwitch()
        sc.onTintColor = Theme.chrisBlue
        sc.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        
        return sc
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(switchControl)
        switchControl.centerYInSuperview()
        switchControl.anchor(top: nil, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSwitchAction(sender: UISwitch) {
        cellModel.isOn = sender.isOn
        delegate?.handleSwitchAction(item: GeneralItem.showOnboarding(cellModel))
    }
}
