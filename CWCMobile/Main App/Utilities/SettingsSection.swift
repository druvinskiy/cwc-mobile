//
//  SettingsSection.swift
//  SettingsTemplate
//
//  Created by Mikaela Caron on 4/14/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

protocol CellItem {}

struct SettingsSection {
    let title: String
    let cells: [CellItem]
}

enum GeneralItem: CellItem {
    case showOnboarding(GeneralSetting)
    case showSwipeMessage(SwitchSetting)
}
