//
//  App.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class App {
    let course: String
    let name: String
    let image: UIImage
    let cellType: CellType
    
    init(courseName: CourseName, appName: AppName, image: UIImage, cellType: CellType) {
        self.course = courseName.rawValue
        self.name = appName.rawValue
        self.image = image
        self.cellType = cellType
    }
    
    enum CellType: String {
        case color, image
    }
    
    static func loadApps() -> [App] {
        return [
            ImageApp(courseName: .fundamentals, appName: .war, image: #imageLiteral(resourceName: "war"), backgroundImage: #imageLiteral(resourceName: "warBackground")),
            ImageApp(courseName: .fundamentals, appName: .match, image: #imageLiteral(resourceName: "match"), backgroundImage: #imageLiteral(resourceName: "matchBackground")),
            ImageApp(courseName: .fundamentals, appName: .quiz, image: #imageLiteral(resourceName: "quizNoPurple"), backgroundImage: #imageLiteral(resourceName: "quizBackground")),
            ColorApp(courseName: .fundamentals, appName: .news, image: #imageLiteral(resourceName: "newsNoBackGround"), backgroundColor: #colorLiteral(red: 0.08994158357, green: 0.3607954979, blue: 0.5560376644, alpha: 1)),
            ColorApp(courseName: .database, appName: .photo, image: #imageLiteral(resourceName: "photoNoBackground"), backgroundColor: .darkGray),
            ColorApp(courseName: .database, appName: .guidebook, image: #imageLiteral(resourceName: "guidebookNoBackground"), backgroundColor: .darkGray)
        ]
    }
}

class ColorApp: App {
    let backgroundColor: UIColor
    
    init(courseName: CourseName, appName: AppName, image: UIImage, backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        super.init(courseName: courseName, appName: appName, image: image, cellType: .color)
    }
}

class ImageApp: App {
    let backgroundImage: UIImage
    
    init(courseName: CourseName, appName: AppName, image: UIImage, backgroundImage: UIImage) {
        self.backgroundImage = backgroundImage
        super.init(courseName: courseName, appName: appName, image: image, cellType: .image)
    }
}
