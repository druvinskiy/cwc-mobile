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
        
        title = "Settings"
    }
    
    func configureTableView() {
        tableView.removeExcessCells()
        tableView.rowHeight = 60
        tableView.dataSource = datasource
        
        tableView.register(GeneralSettingsCell.self, forCellReuseIdentifier: GeneralSettingsCell.generalCellId)
        tableView.register(SwitchSettingsCell.self, forCellReuseIdentifier: SwitchSettingsCell.switchCellId)
    }
    
    // MARK: - TableView Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = sections[indexPath.section].setting(at: indexPath.row)
        
        if let setting = setting as? GeneralItem {
            switch setting {
            case .showOnboarding:
                coordinator?.replayWalkthroughPressed()
            default:
                break
            }
        }
    }
}
