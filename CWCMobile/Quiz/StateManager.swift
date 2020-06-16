//
//  StateManager.swift
//  Quiz
//
//  Created by David Ruvinskiy on 6/16/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import Foundation

class StateManager {
    
    static var questionIndexKey = "QuestionIndexKey"
    static var numCorrectKey = "NumberCorrectKey "
    
    static func saveState(numCorrect: Int, questionIndex: Int) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(questionIndex, forKey: questionIndexKey)
        defaults.set(numCorrect, forKey: numCorrectKey)
    }
    
    static func retrieve(key: String) -> Any? {
        
        let defaults = UserDefaults.standard
        
        return defaults.value(forKey: key)
    }
    
    static func clearState() {
        
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: questionIndexKey)
        defaults.removeObject(forKey: numCorrectKey)
    }
}
