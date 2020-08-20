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
    static let chrisBlueLight = UIColor(named: "Chris Blue Light") ?? UIColor.blue
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

struct Messages {
    static var comingSoon = "The \(AppName.guidebook.rawValue) is coming soon. In the meantime, feel free to check out the other apps you'll learn how to build."
    static var noQuestions = "We don't have any questions for you to answer today. Feel free to watch the above video, though. 🙂"
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
                GeneralItem.showApps(.init(description: "Try our Training Apps")),
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
            MainAppSection(title: "Sample Apps", cells: [
                AppItem.war(.init(courseName: .fundamentals, appName: .war, image: #imageLiteral(resourceName: "war"), page: .init(imageName: "war", headerText: "The first app you'll learn how to build is the \(AppName.war.rawValue).", bodyText: "The \(AppName.war.rawValue) is a two player game between you and the computer. The winner is the player who draws the playing card with the higher value."), backgroundImage: #imageLiteral(resourceName: "warBackground"))),
                AppItem.match(.init(courseName: .fundamentals, appName: .match, image: #imageLiteral(resourceName: "match"), page: .init(imageName: "match", headerText: "You'll then learn how to build the \(AppName.match.rawValue).", bodyText: "In the \(AppName.match.rawValue), you'll turn over two cards at a time in an attempt to match their pictures and make them disappear. Your goal is to get rid of all the cards before time runs out."), backgroundImage: #imageLiteral(resourceName: "matchBackground"))),
                AppItem.quiz(.init(courseName: .fundamentals, appName: .quiz, image: #imageLiteral(resourceName: "quizNoPurple"), page: .init(imageName: "quizPurple", headerText: "Let's continue and look at the \n\(AppName.quiz.rawValue)!", bodyText: "In the \(AppName.quiz.rawValue), you'll learn how to build an app that displays quiz questions to the user. See if you can answer all the questions correctly. 😀"), backgroundImage: #imageLiteral(resourceName: "quizBackground"))),
                AppItem.news(.init(courseName: .fundamentals, appName: .news, image: #imageLiteral(resourceName: "newsNoBackGround"), page: .init(imageName: "news", headerText: "What's the news? Let's find out with the \(AppName.news.rawValue)!", bodyText: "After the \(AppName.quiz.rawValue) you'll learn to build the News App. The app will be able to download news articles from a server and display them for the user to read."), backgroundColor: #colorLiteral(red: 0.08994158357, green: 0.3607954979, blue: 0.5560376644, alpha: 1))),
                AppItem.photo(.init(courseName: .database, appName: .photo, image: #imageLiteral(resourceName: "photoNoBackground"), page: .init(imageName: "photo", headerText: "Let's take a photo with the \(AppName.photo.rawValue).", bodyText: "With the \(AppName.photo.rawValue), users can take and post photos to the app. Users will also have a feed where they can view photos posted by other users."), backgroundColor: .darkGray)),
                AppItem.guidebook(.init(courseName: .database, appName: .guidebook, image: #imageLiteral(resourceName: "guidebookNoBackground"), page: .init(imageName: "guidebook", headerText: "Tell us about your vacation with the \n\(AppName.guidebook.rawValue).", bodyText: "The final app you'll learn to build is the \(AppName.guidebook.rawValue). The app will allow users to save notes and pictures of their favorite vacation places."), backgroundColor: .darkGray))
            ])
        ]
    }
}

struct DayDetails {
    static func loadSections(with day: Day) -> [DayDetailSection] {
        var sections = [
            DayDetailSection(title: "", cells: [
                VideoItem.video(day)
            ]),
            DayDetailSection(title: "Answer the following quiz questions:", cells: [])
        ]
        
        let questions = day.questions
        
        for (index, question) in questions.enumerated() {
            let questionNumber = index + 1
            let section = DayDetailSection(title: "\(questionNumber). \(question.question)", cells: questions[index].shuffledAnswers)
            sections.append(section)
        }
        
        return sections
    }
}

extension SocialNetworkUrl {
    static let twitter = SocialNetworkUrl(scheme: "twitter:///user?screen_name=CodeWithChris", page: "https://twitter.com/CodeWithChris")
    static let youtube = SocialNetworkUrl(scheme: "youtube://CodeWithChris", page: "https://www.youtube.com/user/CodeWithChris")
    static let instagram = SocialNetworkUrl(scheme: "instagram://user?username=codewithchris", page: "https://www.instagram.com/codewithchris")
    static let facebook = SocialNetworkUrl(scheme: "", page: "https://www.facebook.com/CodeWithChris")
    static let courses = SocialNetworkUrl(scheme: "", page: "https://codewithchris.com/courses")
}
