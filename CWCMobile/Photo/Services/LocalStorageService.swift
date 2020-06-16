//
//  LocalStorageService.swift
//  photoapp
//
//  Created by Christopher Ching on 2020-03-31.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import Foundation

class LocalStorageService {
    
    static func saveUser(userId: String?, username: String?) {
        
        // Get a reference to user defaults
        let defaults = UserDefaults.standard
        
        // Save the userId and username to defaults
        defaults.set(userId, forKey: PhotoConstants.LocalStorage.userIdKey)
        defaults.set(username, forKey: PhotoConstants.LocalStorage.usernameKey)
        
    }
    
    static func loadUser() -> PhotoUser? {
        
        // Get a reference to user defaults
        let defaults = UserDefaults.standard
        
        // Get the username and id
        let userId = defaults.value(forKey: PhotoConstants.LocalStorage.userIdKey) as? String
        let username = defaults.value(forKey: PhotoConstants.LocalStorage.usernameKey) as? String
        
        // Return the result
        if userId != nil && username != nil {
            
            // Return saved user
            return PhotoUser(userId: userId, username: username)
        } else {
            // Either user id or username couldn't be retrieved, so return nil
            return nil
        }
    }
    
    static func clearUser() {
        
        // Get a reference to user defaults
        let defaults = UserDefaults.standard
        
        // Clear the values for the keys
        defaults.set(nil, forKey: PhotoConstants.LocalStorage.userIdKey)
        defaults.set(nil, forKey: PhotoConstants.LocalStorage.usernameKey)
    }
    
    static func savePhotoCount(count: Int) {
        
        let defaults = UserDefaults.standard
        defaults.set(count, forKey: PhotoConstants.LocalStorage.savedPhotoCountKey)
    }
    
    static func getPhotoCount() -> Int {
        
        let defaults = UserDefaults.standard
        let counter = defaults.value(forKey: PhotoConstants.LocalStorage.savedPhotoCountKey) as? Int
        guard counter != nil else { return 0 }
        return counter!
    }
    
    static func saveUserIds(userIds: [String]) {
        
        let defaults = UserDefaults.standard
        defaults.set(userIds, forKey: PhotoConstants.LocalStorage.savedUserIdsKey)
    }
    
    static func getSavedUserIds() -> [String] {
        
        let defaults = UserDefaults.standard
        let userIds = defaults.value(forKey: PhotoConstants.LocalStorage.savedUserIdsKey) as? [String]
        guard userIds != nil else { return [] }
        return userIds!
    }
}
