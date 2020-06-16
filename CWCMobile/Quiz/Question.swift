//
//  Question.swift
//  Quiz
//
//  Created by David Ruvinskiy on 6/13/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import Foundation

struct Question: Codable {
    
    var question: String?
    var answers: [String]?
    var correctAnswerIndex: Int?
    var feedback: String?
}
