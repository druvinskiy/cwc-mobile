//
//  CWCPageContol.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class CWCPageControl: UIPageControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(numberOfPages: Int) {
        self.init(frame: .zero)
        self.numberOfPages = numberOfPages
    }
    
    private func configure() {
        currentPage = 0
        currentPageIndicatorTintColor = Theme.chrisBlue
        pageIndicatorTintColor = .lightGray
    }
}
