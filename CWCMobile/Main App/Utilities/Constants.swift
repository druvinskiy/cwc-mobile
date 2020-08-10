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
            // MARK: - Lessons 1 to 10 (including the Bonus 2A)
            .init(subtitle: "Xcode Essentials", description: "In this video, I’ll tell you what you need to learn and give you a tour of Xcode.", video: .init(title: "How to Make an App for Beginners - Lesson 1", thumbnail: #imageLiteral(resourceName: "Video_1"), videoUrl: "https://www.youtube.com/watch?v=jniJeamcIUU"), app: nil),
            
            .init(subtitle: "All About Auto Layout", description: "Jumping right in, you’ll learn how to build layouts.", video: .init(title: "Auto Layout Tutorial - Lesson 2", thumbnail: #imageLiteral(resourceName: "Video_2"), videoUrl: "https://www.youtube.com/watch?v=emojd8GFB0o"), app: nil),
            
//            .init(subtitle: "Auto Layout Bonus Training", description: "Additional information on Auto Layout not covered in Lesson 2.", video: .init(title: "Auto Layout Bonus - Lesson 2A", thumbnail: #imageLiteral(resourceName: "Video_3"), videoUrl: "https://www.youtube.com/watch?v=2tqkuGETgXg"), app: nil),
            
            .init(subtitle: "How To Use Stack Views", description: "Learn how to use Stack View elements to build layouts much more easily.", video: .init(title: "UIStackView Tutorial - Lesson 3", thumbnail: #imageLiteral(resourceName: "Video_4"), videoUrl: "https://www.youtube.com/watch?v=eF9Ut-VpdAI"), app: nil),
            
            .init(subtitle: "Assembling the War User Interface", description: "Put your skills to the test by building the UI for our War Card Game.", video: .init(title: "Your First User Interface - Lesson 4", thumbnail: #imageLiteral(resourceName: "Video_5"), videoUrl: "https://www.youtube.com/watch?v=2CsFQZBKGT8"), app: nil),
            
            .init(subtitle: "Learn Swift Basics (Part 1)", description: "Get hands on with the Swift programming language.", video: .init(title: "Swift Basics - Lesson 5", thumbnail: #imageLiteral(resourceName: "Video_6"), videoUrl: "https://www.youtube.com/watch?v=lFyqd9xrRTY"), app: nil),
            
            .init(subtitle: "Learn Swift Basics (Part 2)", description: "Build upon the skills from the previous lesson and learn more about Swift programming.", video: .init(title: "Swift Basics (Part 2) - Lesson 6", thumbnail: #imageLiteral(resourceName: "Video_7"), videoUrl: "https://www.youtube.com/watch?v=HBshpfGYpmM"), app: nil),
            
            .init(subtitle: "Learn Swift Basics (Part 3)", description: "Finally, we put it all together and I’ll tell you how Swift code plays a part in your app.", video: .init(title: "Swift Basics (Part 3) - Lesson 7", thumbnail: #imageLiteral(resourceName: "Video_8"), videoUrl: "https://www.youtube.com/watch?v=8j8PeENQdqU"), app: nil),
            
            .init(subtitle: "Connecting Elements With Swift Code", description: "You’ll learn how to connect the elements in your layout to the Swift code that you write.", video: .init(title: "IBOutlet Properties and IBAction Methods - Lesson 8", thumbnail: #imageLiteral(resourceName: "Video_9"), videoUrl: "https://www.youtube.com/watch?v=GTaPQp_KFsI"), app: nil),
            
            .init(subtitle: "Handling User Interaction", description: "Learn how to capture and handle taps from the user.", video: .init(title: "Handling User Interaction - Lesson 9", thumbnail: #imageLiteral(resourceName: "Video_10"), videoUrl: "https://www.youtube.com/watch?v=Y2zMP6Pu9Rg"), app: nil),
            
            .init(subtitle: "Writing The Logic", description: "Learn how to write code that THINKS!", video: .init(title: "Coding Logic with IF Statements - Lesson 10", thumbnail: #imageLiteral(resourceName: "Video_11"), videoUrl: "https://www.youtube.com/watch?v=Afp-qjZHZvs"), app: nil),
            
            // MARK: - Lessons 11 to 17
            .init(subtitle: "What You’ll Learn Next", description: "Continue building your Swift skills, learn some critical concepts, build more complex apps and express more complex logic with your Swift code.", video: .init(title: "Intro - Lesson 11", thumbnail: #imageLiteral(resourceName: "Video_12"), videoUrl: "https://www.youtube.com/watch?v=r2swa148uA0"), app: nil),
            
            .init(subtitle: "Where to Get Help on UIKit Classes", description: "Learn 4 different techniques to find documentation and help on UIKit classes and methods.", video: .init(title: "UIKit and Apple Documentation - Lesson 12", thumbnail: #imageLiteral(resourceName: "Video_13"), videoUrl: "https://www.youtube.com/watch?v=oIKgTzB4-vs"), app: nil),
            
            .init(subtitle: "Subclassing", description: "Learn how classes can “build off” of one another. It’s called class inheritance and subclassing. It will save you a ton of time by not rewriting code!", video: .init(title: "Subclassing and Inheritance - Lesson 13", thumbnail: #imageLiteral(resourceName: "Video_14"), videoUrl: "https://www.youtube.com/watch?v=NOSzzWQn03Y"), app: nil),
            
            .init(subtitle: "Arrays", description: "Learn how to work with collections of data by using an Array!", video: .init(title: "Arrays - Lesson 14", thumbnail: #imageLiteral(resourceName: "Video_15"), videoUrl: "https://www.youtube.com/watch?v=339QXSMEGYQ"), app: nil),
            
            .init(subtitle: "Optionals", description: "Think of optionals simply as variables that might contain nil. The only hard part is remembering all of the syntax around optionals.", video: .init(title: "Optionals - Lesson 15", thumbnail: #imageLiteral(resourceName: "Video_16"), videoUrl: "https://www.youtube.com/watch?v=omLs2CDG-5A"), app: nil),
            
            .init(subtitle: "Dictionaries", description: "You’ve learned about Arrays. Dictionaries are another often used and highly useful tool to keep track of collections of data!", video: .init(title: "Dictionaries - Lesson 16", thumbnail: #imageLiteral(resourceName: "Video_17"), videoUrl: "https://www.youtube.com/watch?v=DZkCQ4q-qV0"), app: nil),
            
            .init(subtitle: "Loops", description: "Loops come in handy to let you go through each item in the collection and execute some code for each!", video: .init(title: "Loops - Lesson 17", thumbnail: #imageLiteral(resourceName: "Video_18"), videoUrl: "https://www.youtube.com/watch?v=X9ywwPRcpII"), app: nil),
            
            // MARK: - Lessons 18 to 29
            .init(subtitle: "Previewing What You’ll Build", description: "In this lesson, I’ll show you the app you’ll build as well as all of the new skills you’ll learn!", video: .init(title: "The Card Game: Intro - Lesson 18", thumbnail: #imageLiteral(resourceName: "Video_19"), videoUrl: "https://www.youtube.com/watch?v=YHUN1btBtyY"), app: nil),
            
            .init(subtitle: "Model View Controller", description: "Learn about a KEY design pattern that will help you write reusable and code that is easily maintained.", video: .init(title: "The Card Game: The MVC Design Pattern - Lesson 19", thumbnail: #imageLiteral(resourceName: "Video_20"), videoUrl: "https://www.youtube.com/watch?v=ThLRaJ4dmuM"), app: nil),
            
            .init(subtitle: "Project Setup", description: "Here we create the Xcode project, including setting the orientation for the app and setting up some of the user interface elements!", video: .init(title: "The Card Game: Project Setup - Lesson 20", thumbnail: #imageLiteral(resourceName: "Video_21"), videoUrl: "https://www.youtube.com/watch?v=M0CqCuN-OHo"), app: nil),
            
            .init(subtitle: "Custom Classes", description: "In this lesson, you’ll be setting up the custom classes that we talked about earlier.", video: .init(title: "The Card Game: Custom Classes - Lesson 21", thumbnail: #imageLiteral(resourceName: "Video_22"), videoUrl: "https://www.youtube.com/watch?v=goi26Yp41A4"), app: nil),
            
            .init(subtitle: "Protocols & Delegates", description: "The protocol and delegate pattern is used by many user interface elements in UIKit to communicate with the view controller.", video: .init(title: "The Card Game: Protocols and Delegates - Lesson 22", thumbnail: #imageLiteral(resourceName: "Video_23"), videoUrl: "https://www.youtube.com/watch?v=iJ5kJi-sC1M"), app: nil),
            // Protocols and Delegates Implementation
            .init(subtitle: "Implementing Protocols & Delegates ", description: "Now we will implement what we learned in the previous lesson into the project we are working on.", video: .init(title: "The Card Game: Implementing Protocols and Delegates - Lesson 23", thumbnail: #imageLiteral(resourceName: "Video_24"), videoUrl: "https://www.youtube.com/watch?v=YQiJyNEI87I"), app: nil),
            
            .init(subtitle: "Xcode Best Practices", description: "This lesson reveals some best practices when it comes to organizing and setting up your Xcode project.", video: .init(title: "The Card Game: Xcode Best Practices - Lesson 24", thumbnail: #imageLiteral(resourceName: "Video_25"), videoUrl: "https://www.youtube.com/watch?v=AIanZjUiFzA"), app: nil),
            
            .init(subtitle: "Debugging", description: "Xcode gives you many tools to figure out what’s wrong with your project and this lesson will teach you how to use them!", video: .init(title: "The Card Game: Debugging your App - Lesson 25", thumbnail: #imageLiteral(resourceName: "Video_26"), videoUrl: "https://www.youtube.com/watch?v=6MDvI_8PpZI"), app: nil),
            
            .init(subtitle: "Card Flipping", description: "By the end of this lesson, you’ll be able to tap on a card to flip it over!", video: .init(title: "The Card Game: Card Flipping - Lesson 26", thumbnail: #imageLiteral(resourceName: "Video_27"), videoUrl: "https://www.youtube.com/watch?v=Mt5Ifim1BBs"), app: nil),
            
            .init(subtitle: "Game Logic", description: "In this lesson, you’ll implement the logic for the game.", video: .init(title: "The Card Game: Game Logic - Lesson 27", thumbnail: #imageLiteral(resourceName: "Video_28"), videoUrl: "https://www.youtube.com/watch?v=YH2ouLMMN9I"), app: nil),
            
            .init(subtitle: "Win Condition", description: "In this lesson, you’ll implement a countdown timer so that the player only has a short amount of time to win.", video: .init(title: "The Card Game: Win Condition - Lesson 28", thumbnail: #imageLiteral(resourceName: "Video_29"), videoUrl: "https://www.youtube.com/watch?v=6gsGmcdSYFQ"), app: nil),
            
            .init(subtitle: "Sounds", description: "You’ll learn how to include these sounds into your Xcode project and use the AVAudioPlayer class to play them!", video: .init(title: "The Card Game: Adding Sounds - Lesson 29", thumbnail: #imageLiteral(resourceName: "Video_30"), videoUrl: "https://www.youtube.com/watch?v=4aJudDL6cSw"), app: nil)
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
