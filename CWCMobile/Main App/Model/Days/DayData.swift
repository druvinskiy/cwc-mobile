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
    var questions = [DecodeQuestion]()
    let page: MainAppPage?
}

struct DecodeQuestion: Codable {
    let question: String
    let shouldShuffle: Bool?
    
    private var answers = [Answer]()
    
    var shuffledAnswers: [Answer] {
        return shouldShuffle ?? true ? answers.shuffled() : answers 
    }
}
