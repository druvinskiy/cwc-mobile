//
//  MySettingsCellDelegate.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/21/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class MySettingsCellDelegate: SettingsCellDelegate {
    let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func handleSwitchAction(isEnabled: Bool, cell: SettingsCell) {
        guard let indexPath = tableView.indexPath(for: cell),
            let section = SettingsSection(rawValue: indexPath.section) else { return }
        
        switch section {
        case .general:
            let general = GeneralOptions(rawValue: indexPath.row)
            
            switch general {
            case .showSwipeMessage:
                MainLocalStorageService.set(isFloatingViewEnabled: isEnabled)
            default:
                break
            }
        }
    }
}
