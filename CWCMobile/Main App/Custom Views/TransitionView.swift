//
//  TransitionView.swift
//  CWCMobile
//
//  Created by Chris Parker on 19/6/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//
/*  Purpose: This view is added as a subView to the AppsVC to hide the Apps Collection view
            on the firstLaunch where the onboarding view is presented modally.
            It is then removed from the superView after a delay of 2 seconds so that when
            the user selects the Apps collection view it is dispayed as intended.
*/

import UIKit

class TransitionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
}
