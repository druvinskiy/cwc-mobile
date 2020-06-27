//
//  SettingsDataSource.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

//swiftlint:disable weak_delegate

class SettingsDataSource: NSObject, UITableViewDataSource {
    fileprivate let sections: [SettingsSection]
    fileprivate let settingsDelegate = MySettingsCellDelegate()
    
    init(sections: [SettingsSection]) {
        self.sections = sections
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].settingsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = sections[indexPath.section].setting(at: indexPath.row)
        var cell = UITableViewCell()
        
        if let setting = setting as? GeneralItem {
            switch setting {
            case .courses(let cellModel):
                cell = createURLImageSettingCell(with: cellModel, tableView: tableView)
            case .showOnboarding(let cellModel):
                cell = createGeneralSettingsCell(with: cellModel, tableView: tableView)
            case .showSwipeMessage(let cellModel):
                cell = createSwitchSettingsCell(with: cellModel, tableView: tableView)
            }
        }
        
        if let setting = setting as? SocialItem {
            switch setting {
            case .twitter(let cellModel),
                 .youtube(let cellModel),
                 .instagram(let cellModel),
                 .facebook(let cellModel):
                
                cell = createURLImageSettingCell(with: cellModel, tableView: tableView)
            }
        }
        
        if let setting = setting as? ProfileItem {
            switch setting {
            case .profile1(let cellModel),
                 .profile2(let cellModel),                 
                 .profile3(let cellModel):
                
                cell = createProfileSettingCell(with: cellModel, tableView: tableView)
            }
        }
        
        return cell
    }
    
    func createURLImageSettingCell(with cellModel: URLImageSetting, tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: URLImageSettingCell.imageCellId) as? URLImageSettingCell else { return UITableViewCell() }
        cell.urlCellModel = cellModel
        return cell
    }
    
    func createSwitchSettingsCell(with cellModel: SwitchSetting, tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchSettingsCell.switchCellId) as? SwitchSettingsCell else { return UITableViewCell() }
        cell.cellModel = cellModel
        cell.delegate = settingsDelegate
        return cell
    }
    
    func createGeneralSettingsCell(with cellModel: GeneralSetting, tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GeneralSettingsCell.generalCellId) as? GeneralSettingsCell else { return UITableViewCell() }
        cell.cellModel = cellModel
        return cell
        
    }
    
    func createProfileSettingCell(with cellModel: ImageSetting, tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GeneralSettingsCell.generalCellId) as? ImageSettingCell else { return UITableViewCell() }
        cell.imageCellModel = cellModel
        return cell
    }
}
