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
    
    init(courseName: CourseName, appName: AppName, image: UIImage) {
        self.course = courseName.rawValue
        self.name = appName.rawValue
        self.image = image
    }
}

class ColorApp: App {
    let backgroundColor: UIColor
    
    init(courseName: CourseName, appName: AppName, image: UIImage, backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        super.init(courseName: courseName, appName: appName, image: image)
    }
}

class ImageApp: App {
    let backgroundImage: UIImage
    
    init(courseName: CourseName, appName: AppName, image: UIImage, backgroundImage: UIImage) {
        self.backgroundImage = backgroundImage
        super.init(courseName: courseName, appName: appName, image: image)
    }
}
