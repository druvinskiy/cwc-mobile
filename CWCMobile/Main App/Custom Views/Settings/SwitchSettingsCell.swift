//
//  SwitchSettingsCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

protocol SwitchSettingsCellDelegate: AnyObject {
    func handleSwitchAction(item: GeneralItem)
}

class SwitchSettingsCell: UITableViewCell {
    weak var delegate: SwitchSettingsCellDelegate?
    static let switchCellId = "switchCellId"
    
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
