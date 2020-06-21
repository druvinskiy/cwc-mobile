//
//  Constants.swift
//  photoapp
//
//  Created by Christopher Ching on 2020-03-31.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import Foundation

struct PhotoConstants {
    
    struct Storyboard {
        
        static let photoCellId = "Photo Cell"
        static let profileSegue = "goToCreateProfile"
    }
    
    struct LocalStorage {
        
        static let userIdKey = "storedUserId"
        static let usernameKey = "storedUsername"
        static let savedPhotoCountKey = "savedPhotoCount"
        static let savedUserIdsKey = "savedUserIds"
        
    }
    
    struct PhotoRestrictions {
        
        static let numAllowedPhotos = 3
        static let alertTitle = "Photo Limit Reached"
        static let alertMessage = "You may only save a maximum of \(numAllowedPhotos) images in this sample \(AppName.photo.rawValue).\n\nConsider enrolling in the iOS Databases course to build your own version of the app."
    }
}
