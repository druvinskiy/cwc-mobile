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
    fileprivate lazy var settingsDelegate = MySettingsCellDelegate(tableView: tableView)
    
    fileprivate let sections: [SettingsSection] = Settings.loadSettingsSections()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        title = "Settings"
    }
    
    func configureTableView() {
        tableView.removeExcessCells()
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.generalSettingsCellId)
        tableView.register(SwitchSettingsCell.self, forCellReuseIdentifier: SwitchSettingsCell.switchSettingsCellId)
    }
    
    // MARK: - TableView Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = sections[indexPath.section].cells[indexPath.row]
        var cell = UITableViewCell()
        
        if let setting = setting as? GeneralItem {
            switch setting {
            case .showOnboarding(let cellModel):
                cell = createGeneralSettingsCell(with: cellModel)
            case .showSwipeMessage(let cellModel):
                cell = createSwitchSettingsCell(with: cellModel)
            }
        }
        
        return cell
    }
    
    func createSwitchSettingsCell(with cellModel: SwitchSetting) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchSettingsCell.switchSettingsCellId) as? SwitchSettingsCell else { return UITableViewCell() }
        cell.cellModel = cellModel
        cell.delegate = settingsDelegate
        return cell
    }
    
    func createGeneralSettingsCell(with cellModel: GeneralSetting) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.generalSettingsCellId) as? SettingsCell else { return UITableViewCell() }
        cell.cellModel = cellModel
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = sections[indexPath.section].cells[indexPath.row]
        
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
