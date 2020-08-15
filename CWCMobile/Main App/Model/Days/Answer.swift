//
//  Answer.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/12/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

class Answer: DayDetailCellItem {
    var text: String
    let title: String
    let action = "Okay"
    var feedback: String
    var isCorrect: Bool
    
    init(text: String, feedback: String = "", isCorrect: Bool = false) {
        self.text = text
        self.feedback = feedback
        self.title = isCorrect ? "Correct!" : "Incorrect"
        self.isCorrect = isCorrect
    }
}
