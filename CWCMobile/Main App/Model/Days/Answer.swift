//
//  Answer.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/12/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

class Answer: DayDetailCellItem, Codable {
    var text: String
    var title: String {
        return isCorrect ? "Correct!" : "Incorrect!"
    }
    let action = "Okay"
    var feedback: String
    var isCorrect: Bool
}
