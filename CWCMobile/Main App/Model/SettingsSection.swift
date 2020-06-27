//
//  SettingsSection.swift
//  SettingsTemplate
//
//  Created by David Ruvinskiy on 4/14/19.
//  Copyright © 2019 David Ruvinskiy. All rights reserved.
//

import Foundation

protocol CellItem {}

struct SettingsSection {
    let title: String
    fileprivate var cells: [CellItem]
    
    init(title: String, cells: [CellItem]) {
        self.title = title
        self.cells = cells
    }
    
    func setting(at index: Int) -> CellItem {
        return cells[index]
    }
    
    func settingsCount() -> Int {
        return cells.count
    }
}

enum GeneralItem: CellItem {
    case courses(SocialSetting)
    case showOnboarding(GeneralSetting)
    case showSwipeMessage(SwitchSetting)
}

enum SocialItem: CellItem {
    case twitter(SocialSetting)
    case youtube(SocialSetting)
    case instagram(SocialSetting)
    case facebook(SocialSetting)
}

enum ProfileItem: CellItem {
    case profile1(ImageSetting)
    case profile2(ImageSetting)
    case profile3(ImageSetting)
}
