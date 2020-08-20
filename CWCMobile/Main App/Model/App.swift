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
    let page: MainAppPage
    
    init(courseName: CourseName, appName: AppName, image: UIImage, page: MainAppPage) {
        self.course = courseName.rawValue
        self.name = appName.rawValue
        self.image = image
        self.page = page
    }
}

class ColorApp: App {
    let backgroundColor: UIColor
    
    init(courseName: CourseName, appName: AppName, image: UIImage, page: MainAppPage, backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        super.init(courseName: courseName, appName: appName, image: image, page: page)
    }
}

class ImageApp: App {
    let backgroundImage: UIImage
    
    init(courseName: CourseName, appName: AppName, image: UIImage, page: MainAppPage, backgroundImage: UIImage) {
        self.backgroundImage = backgroundImage
        super.init(courseName: courseName, appName: appName, image: image, page: page)
    }
}
