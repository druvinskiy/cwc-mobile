//
//  SettingsVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/20/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

//swiftlint:disable weak_delegate

class SettingsVC: UITableViewController {
    
    weak var coordinator: SettingsCoordinator?
    
    fileprivate let settingsCellId = "settingsCellId"
    fileprivate lazy var settingsDelegate = MySettingsCellDelegate(tableView: tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        title = "Settings"
    }
    
    func configureTableView() {
        tableView.removeExcessCells()
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: settingsCellId)
    }
    
    // MARK: - TableView Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSection(rawValue: section) else { return 0}
        
        switch section {
        case .general:
            return GeneralOptions.allCases.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: settingsCellId, for: indexPath) as? SettingsCell,
            let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell()}
        
        switch section {
        case .general:
            let general = GeneralOptions(rawValue: indexPath.row)
            cell.sectionType = general
            cell.delegate = settingsDelegate
            
            switch general {
            case .showSwipeMessage:
                cell.switchControl.isOn = MainLocalStorageService.isFloatingViewEnabled()
            default:
                break
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = SettingsSection(rawValue: indexPath.section) else { return }
        
        switch section {
        case .general:
            let general = GeneralOptions(rawValue: indexPath.row)
            
            switch general {
            case .showOnboarding:
                coordinator?.replayWalkthroughPressed()
            default:
                break
            }
        }
    }
}
