//
//  AnswerResponseView.swift
//  CWCMobile
//
//  Created by Chris Parker on 14/8/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AnswerResponseContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
    }

}
