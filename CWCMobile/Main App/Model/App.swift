//
//  App.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class App: Codable {
    let course: String
    let name: String
//    let image: UIImage
    
    init(courseName: CourseName, appName: AppName, image: UIImage) {
        self.course = courseName.rawValue
        self.name = appName.rawValue
//        self.image = image
    }
}
