//
//  DayDetailQuestion.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/12/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

struct DayDetailQuestion: Codable {
    private var answers = [Answer]()
    private var shouldShuffle: Bool
    
    var question = ""
    
    var shuffledAnswers: [Answer] {
        return shouldShuffle ? answers.shuffled() : answers
    }
    
    init(question: DecodeQuestion) {
        self.question = question.question
        self.answers = question.answers
        self.shouldShuffle = (question.preventShuffling != nil) ? false : true
    }
}
