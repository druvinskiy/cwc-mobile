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
    case courses(URLImageSetting)
    case showOnboarding(GeneralSetting)
    case showSwipeMessage(SwitchSetting)
}

enum SocialItem: CellItem {
    case twitter(URLImageSetting)
    case youtube(URLImageSetting)
    case instagram(URLImageSetting)
    case facebook(URLImageSetting)
}
