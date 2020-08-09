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
    static let chrisBlueNavigation = UIColor(named: "Chris Blue Navigation") ?? UIColor.blue
    static let rowLight = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
    static let rowDark = UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.0)
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
        ]
    }
}

struct MainApp {
    static func loadDays() -> [Day] {
        return [
            .init(subtitle: "Xcode Essentials", description: "In this video, I’ll tell you what you need to learn and give you a tour of Xcode.", video: .init(title: "How to Make an App for Beginners - Lesson 1", thumbnail: #imageLiteral(resourceName: "Video_1"), videoUrl: "https://www.youtube.com/watch?v=jniJeamcIUU"), app: nil),
            .init(subtitle: "All About Auto Layout", description: "Jumping right in, you’ll learn how to build layouts.", video: .init(title: "Auto Layout Tutorial - Lesson 2", thumbnail: #imageLiteral(resourceName: "Video_2"), videoUrl: "https://www.youtube.com/watch?v=emojd8GFB0o"), app: nil)
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
