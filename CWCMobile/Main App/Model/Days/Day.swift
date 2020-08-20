//
//  Day.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/7/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

class Day: Codable {
    var number = -1
    let subtitle: String
    let description: String
    let video: Video
    var questions = [DayDetailQuestion]()
    let page: MainAppPage?
    
    init(day: DecodeDay) {
        self.subtitle = day.subtitle
        self.description = day.description
        self.video = day.video
        self.questions = day.questions
        self.page = day.page
    }
    
    static func loadDays() -> [Day] {
        let result = Bundle.main.decode("days.json") as DayData
        return result.days.map({ Day(day: $0) })
    }
}
