//
//  SettingsSection.swift
//  SettingsTemplate
//
//  Created by David Ruvinskiy on 4/14/19.
//  Copyright © 2019 David Ruvinskiy. All rights reserved.
//

import Foundation

protocol SettingsCellItem {}

struct SettingsSection {
    let title: String
    fileprivate var cells: [SettingsCellItem]
    
    init(title: String, cells: [SettingsCellItem]) {
        self.title = title
        self.cells = cells
    }
    
    func setting(at index: Int) -> SettingsCellItem {
        return cells[index]
    }
    
    func settingsCount() -> Int {
        return cells.count
    }
}

enum GeneralItem: SettingsCellItem {
    case courses(SocialSetting)
    case showOnboarding(GeneralSetting)
    case showSwipeMessage(SwitchSetting)
}

enum SocialItem: SettingsCellItem {
    case twitter(SocialSetting)
    case youtube(SocialSetting)
    case instagram(SocialSetting)
    case facebook(SocialSetting)
}

enum ProfileItem: SettingsCellItem {
    case profile1(ImageSetting)
    case profile2(ImageSetting)
    case profile3(ImageSetting)
}
