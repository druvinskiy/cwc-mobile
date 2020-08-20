//
//  SettingsVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/20/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {
    
    weak var coordinator: SettingsCoordinator?
    fileprivate let sections = Settings.loadSettingsSections()
    fileprivate lazy var datasource = SettingsDataSource(sections: sections)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Settings"
    }
    
    func configureTableView() {
        tableView.removeExcessCells()
        tableView.rowHeight = 60
        tableView.dataSource = datasource
        
        tableView.register(GeneralSettingsCell.self, forCellReuseIdentifier: GeneralSettingsCell.generalCellId)
        tableView.register(SwitchSettingsCell.self, forCellReuseIdentifier: SwitchSettingsCell.switchCellId)
        tableView.register(SocialSettingCell.self, forCellReuseIdentifier: SocialSettingCell.imageCellId)
    }
    
    // MARK: - TableView Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = sections[indexPath.section].setting(at: indexPath.row)
        
        if let setting = setting as? GeneralItem { generalSettingTapped(setting: setting) }
        if let setting = setting as? SocialItem { socialSettingTapped(setting: setting) }
        if let setting = setting as? ProfileItem { profileSettingTapped(setting: setting) }
    }
    
    fileprivate func generalSettingTapped(setting: GeneralItem) {
        switch setting {
        case .showOnboarding:
            coordinator?.replayWalkthroughPressed()
        case .courses(let cellModel):
            cellModel.openPage()
        case .showSwipeMessage:
            break
        case .showApps:
            coordinator?.browseAppsPressed()
        }
    }
    
    fileprivate func socialSettingTapped(setting: SocialItem) {
        switch setting {
        case .twitter(let cellModel),
             .youtube(let cellModel),
             .instagram(let cellModel),
             .facebook(let cellModel):
            
            cellModel.openPage()
        }
    }
    
    fileprivate func profileSettingTapped(setting: ProfileItem) {
        switch setting {
        case .profile1:
            break
        case .profile2:
            break
        case .profile3:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderView(settingsSection: sections[section])
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
