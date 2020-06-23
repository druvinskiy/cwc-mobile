//
//  MySettingsCellDelegate.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/21/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class MySettingsCellDelegate: SwitchSettingsCellDelegate {
    let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func handleSwitchAction(item: GeneralItem) {
        switch item {
        case .showOnboarding(let setting):
            if let setting = setting as? SwitchSetting {
                MainLocalStorageService.set(isFloatingViewEnabled: setting.isOn)
            }
        default:
            break
        }
    }
}
