//
//  OnboardingPage.swift
//  autolayout_lbta
//
//  Created by Brian Voong on 10/13/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import Foundation

class OnboardingPage {
    
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
    
    static func loadPages() -> [OnboardingPage] {
        return [
            OnboardingPage(imageName: "badge", headerText: "Learn iOS App Development in 29 Days", bodyText: "iOS app development is one of the most sought after skills today.\n\nBut learning how to build apps without a plan leads to certain failure.\n\nThis 29 Day Beginner Challenge gives you the exact learning plan to gain the core skills for iOS app development.\n\nIt’s for absolute beginners and it’ll help you get results without wasting time. Ready to get started?"),
            OnboardingPage(imageName: "intro", headerText: "INTRODUCTION:\nGain a Solid Foundation", bodyText: "In the next 29 days, you’ll gain the core skills to build your own simple apps.\n\nIn addition to that, you’ll have a solid foundation to build from and further improve your skills to build more complex apps."),
            OnboardingPage(imageName: "calendar10", headerText: "DAYS 1 – 10:\nYour First App", bodyText: "You’re going to get an orientation of the Xcode development environment, a tiny taste of Swift code and you’ll also make your very first app!\n\nBy Day 10, you’ll have a good understanding of how apps are built.\n\nStarting is always the hardest part so don’t think too much and let’s just dive in!", cellType: .start)
        ]
    }
}
