//
//  DayData.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/16/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

struct DayData: Codable {
    let days: [DecodeDay]
}

class DecodeDay: Codable {
    let subtitle: String
    let description: String
    let video: Video
    let app: App?
    var questions = [DayDetailQuestion]()
}
