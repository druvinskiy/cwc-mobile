//
//  SettingsSection.swift
//  SettingsTemplate
//
//  Created by Mikaela Caron on 4/14/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case general
    
    var description: String {
        switch self {
        case .general:
            return "General"
        }
    }
}

enum GeneralOptions: Int, CaseIterable, SectionType {
    case showOnboarding
    case showSwipeMessage
    
    var containsSwitch: Bool {
        switch self {
        case .showOnboarding:
            return false
        case .showSwipeMessage:
            return true
        }
    }
    
    var description: String {
        switch self {
        case .showOnboarding:
            return "Replay Walkthrough"
        case .showSwipeMessage:
            return "Show \"Swipe Down\" Message"
        }
    }
}
