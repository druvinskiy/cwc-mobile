//
//  MainLocalStorageService.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/21/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

class MainLocalStorageService {
    fileprivate static let defaults: UserDefaults = {
        let ud = UserDefaults.standard
        ud.register(defaults: [Keys.floatingViewKey: true])
        return ud
    }()
    
    static func isFloatingViewEnabled() -> Bool {
        return defaults.bool(forKey: Keys.floatingViewKey)
    }
    static func set(isFloatingViewEnabled: Bool) {
        defaults.set(isFloatingViewEnabled, forKey: Keys.floatingViewKey)
    }
}
