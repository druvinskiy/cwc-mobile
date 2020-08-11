//
//  Day.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/7/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

class Day {
    var number = 1
    let subtitle: String
    let description: String
    let video: Video
    let app: App?
    
    init(subtitle: String, description: String, video: Video, app: App?) {
        self.subtitle = subtitle
        self.description = description
        self.video = video
        self.app = app
    }
}
