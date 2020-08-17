//
//  DayDetailQuestion.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/12/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

struct DayDetailQuestion: Codable {
    var question = ""
    private var answers = [Answer]()
    
    var shuffledAnswers: [Answer] {
        return answers.shuffled()
    }
    
    init(question: String, answers: [Answer]) {
        self.question = question
        
        guard let feedbackAnswer = answers.first(where: { $0.feedback != "" }) else { return }
        let feedback = feedbackAnswer.feedback
        
        self.answers = answers.map {
            let copy = $0
            copy.feedback = feedback
            return copy
        }
    }
}
