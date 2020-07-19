//
//  Page.swift
//  autolayout_lbta
//
//  Created by Brian Voong on 10/13/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import Foundation

struct Page {
    
    let imageName: String
    let headerText: String
    let bodyText: String
    let cellType: CellType
    
    init(imageName: String, headerText: String, bodyText: String, cellType: CellType = .app) {
        self.imageName = imageName
        self.headerText = headerText
        self.bodyText = bodyText
        self.cellType = cellType
    }
    
    enum CellType: String {
        case app, start
    }
    
    static func loadPages() -> [Page] {
        return [
            Page(imageName: "chrisLogo", headerText: "Welcome to CWC Mobile!", bodyText: "Are you ready to learn how to build apps? If you're following our “Core Three” learning path, this app will allow you to play around with some of the apps you'll be building."),
            Page(imageName: "war", headerText: "The first app you'll learn how to build is the \(AppName.war.rawValue).", bodyText: "The \(AppName.war.rawValue) is a two player game between you and the computer. The winner is the player who draws the playing card with the higher value."),
            Page(imageName: "match", headerText: "You'll then learn how to build the \(AppName.match.rawValue).", bodyText: "In the \(AppName.match.rawValue), you'll turn over two cards at a time in an attempt to match their pictures and make them disappear. Your goal is to get rid of all the cards before time runs out."),
            Page(imageName: "quizPurple", headerText: "Let's continue and look at the \n\(AppName.quiz.rawValue)!", bodyText: "In the \(AppName.quiz.rawValue), you'll learn how to build an app that displays quiz questions to the user. See if you can answer all the questions correctly. 😀"),
            Page(imageName: "news", headerText: "What's the news? Let's find out with the \(AppName.news.rawValue)!", bodyText: "After the \(AppName.quiz.rawValue) you'll learn to build the News App. The app will be able to download news articles from a server and display them for the user to read."),
            Page(imageName: "photo", headerText: "Let's take a photo with the \(AppName.photo.rawValue).", bodyText: "With the \(AppName.photo.rawValue), users can take and post photos to the app. Users will also have a feed where they can view photos posted by other users."),
            Page(imageName: "guidebook", headerText: "Tell us about your vacation with the \n\(AppName.guidebook.rawValue).", bodyText: "The final app you'll learn to build is the \(AppName.guidebook.rawValue). The app will allow users to save notes and pictures of their favorite vacation places."),
            Page(imageName: "fundamentals", headerText: "Are you ready to try the apps you'll soon learn how to build?", bodyText: "If so, click the button below and enjoy!", cellType: .start)
        ]
    }
}
