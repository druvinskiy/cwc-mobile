//
//  SettingsVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/20/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {
    
    fileprivate let settingsCellId = "settingsCellId"
    
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
        }
        
        return cell
    }
}
