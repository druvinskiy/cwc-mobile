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
                GeneralItem.courses(.init(description: "Browse our Courses", image: #imageLiteral(resourceName: "smallerLogo"), url: URL.courses)),
                GeneralItem.showOnboarding(.init(description: "Replay Walkthrough")),
                GeneralItem.showSwipeMessage(.init(description: "Show \"Swipe Down\" Message", isOn: MainLocalStorageService.isFloatingViewEnabled()))
            ]),
            SettingsSection(title: "Connect with us on Social Media", cells: [
                SocialItem.twitter(.init(description: "Twitter", image: #imageLiteral(resourceName: "twitter"), url: URL.twitter)),
                SocialItem.youtube(.init(description: "YouTube", image: #imageLiteral(resourceName: "youtube"), url: URL.youtube)),
                SocialItem.instagram(.init(description: "Instagram", image: #imageLiteral(resourceName: "instagram"), url: URL.instagram)),
                SocialItem.facebook(.init(description: "Facebook", image: #imageLiteral(resourceName: "facebook"), url: URL.facebook))
            ])
        ]
    }
}

extension URL {
    static let twitter = URL(string: "https://twitter.com/CodeWithChris")
    static let youtube = URL(string: "https://www.youtube.com/user/CodeWithChris")
    static let instagram = URL(string: "https://www.instagram.com/codewithchris")
    static let facebook = URL(string: "https://www.facebook.com/CodeWithChris/")
    static let courses = URL(string: "https://codewithchris.com/courses/")
}
