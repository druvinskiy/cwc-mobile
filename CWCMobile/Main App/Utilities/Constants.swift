//
//  Constants.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class Theme {
    static let chrisBlue = UIColor(named: "Chris Blue")
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
                GeneralItem.showOnboarding(.init(description: "Replay Walkthrough")),
                GeneralItem.showSwipeMessage(.init(description: "Show \"Swipe Down\" Message", isOn: MainLocalStorageService.isFloatingViewEnabled()))
            ])
        ]
    }
}

//Connect with us on Social Media
