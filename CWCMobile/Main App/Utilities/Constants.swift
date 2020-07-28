//
//  Constants.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class Theme {
    static let chrisBlue = UIColor(named: "Chris Blue") ?? UIColor.blue
}

enum AppName: String {
    case war = "War Card Game"
    case match = "Match App"
    case quiz = "Quiz App"
    case news = "News App"
    case photo = "Photo App"
    case guidebook = "Guidebook App"
}

enum CourseName: String {
    case fundamentals = "Fundamentals"
    case database = "Database"
}

enum ScreenSize {
    static let width        = UIScreen.main.bounds.size.width
    static let height       = UIScreen.main.bounds.size.height
    static let maxLength    = max(ScreenSize.width, ScreenSize.height)
    static let minLength    = min(ScreenSize.width, ScreenSize.height)
}

enum DeviceTypes {
    static let idiom        = UIDevice.current.userInterfaceIdiom
    static let nativeScale  = UIScreen.main.nativeScale
    static let scale        = UIScreen.main.scale
    
    static let isiPhoneSE               = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhoneSE2              = idiom == .phone && ScreenSize.maxLength == 667.0
    static let isiPhone8Standard        = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed          = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard    = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed      = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX                = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhone11Pro            = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr       = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad                   = idiom == .pad && ScreenSize.maxLength >= 1024.0
    
    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}
    
    struct AlertMessage {
        static var comingSoon = "The \(AppName.guidebook.rawValue) is coming soon. In the meantime, feel free to check out the other apps you'll learn how to build."
    }
    
    struct Keys {
        static let onboardingKey = "onboarding"
        static let floatingViewKey = "floatingView"
    }
    
    struct Settings {
        static func loadSettingsSections() -> [SettingsSection] {
            return [
                SettingsSection(title: "General", cells: [
                    GeneralItem.courses(.init(description: "Browse our Courses", image: #imageLiteral(resourceName: "smallerLogo"), socialNetworkUrl: .courses)),
                    GeneralItem.showOnboarding(.init(description: "Replay Walkthrough")),
                    GeneralItem.showSwipeMessage(.init(description: "Show \"Swipe Down\" Message", isOn: MainLocalStorageService.isFloatingViewEnabled()))
                ]),
                SettingsSection(title: "Connect with us on Social Media", cells: [
                    SocialItem.twitter(.init(description: "Twitter", image: #imageLiteral(resourceName: "twitter"), socialNetworkUrl: .twitter)),
                    SocialItem.youtube(.init(description: "YouTube", image: #imageLiteral(resourceName: "youtube"), socialNetworkUrl: .youtube)),
                    SocialItem.instagram(.init(description: "Instagram", image: #imageLiteral(resourceName: "instagram"), socialNetworkUrl: .instagram)),
                    SocialItem.facebook(.init(description: "Facebook", image: #imageLiteral(resourceName: "facebook"), socialNetworkUrl: .facebook))
                ])
                //            SettingsSection(title: "App Coding Credits", cells: [
                //                ProfileItem.profile1(.init(description: "David Ruvinskiy", image: #imageLiteral(resourceName: "DavidR"))),
                //                ProfileItem.profile2(.init(description: "Chris Parker", image: #imageLiteral(resourceName: "ChrisP")))
                //            ])
            ]
        }
    }
    
    extension SocialNetworkUrl {
        static let twitter = SocialNetworkUrl(scheme: "twitter:///user?screen_name=CodeWithChris", page: "https://twitter.com/CodeWithChris")
        static let youtube = SocialNetworkUrl(scheme: "youtube://CodeWithChris", page: "https://www.youtube.com/user/CodeWithChris")
        static let instagram = SocialNetworkUrl(scheme: "instagram://user?username=codewithchris", page: "https://www.instagram.com/codewithchris")
        static let facebook = SocialNetworkUrl(scheme: "", page: "https://www.facebook.com/CodeWithChris")
        static let courses = SocialNetworkUrl(scheme: "", page: "https://codewithchris.com/courses")
}
