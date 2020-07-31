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
    static func loadSections() -> [MainAppSection] {
        return [
            MainAppSection(title: "Beginner Series Videos", cells: (Bundle.main.decode("videos.json") as VideoData).videos),
            MainAppSection(title: "Sample Apps", cells: [
                AppItem.war(.init(courseName: .fundamentals, appName: .war, image: #imageLiteral(resourceName: "war"), backgroundImage: #imageLiteral(resourceName: "warBackground"))),
                AppItem.match(.init(courseName: .fundamentals, appName: .match, image: #imageLiteral(resourceName: "match"), backgroundImage: #imageLiteral(resourceName: "matchBackground"))),
                AppItem.quiz(.init(courseName: .fundamentals, appName: .quiz, image: #imageLiteral(resourceName: "quizNoPurple"), backgroundImage: #imageLiteral(resourceName: "quizBackground"))),
                AppItem.news(.init(courseName: .fundamentals, appName: .news, image: #imageLiteral(resourceName: "newsNoBackGround"), backgroundColor: #colorLiteral(red: 0.08994158357, green: 0.3607954979, blue: 0.5560376644, alpha: 1))),
                AppItem.photo(.init(courseName: .database, appName: .photo, image: #imageLiteral(resourceName: "photoNoBackground"), backgroundColor: .darkGray)),
                AppItem.guidebook(.init(courseName: .database, appName: .guidebook, image: #imageLiteral(resourceName: "guidebookNoBackground"), backgroundColor: .darkGray))
            ])
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
