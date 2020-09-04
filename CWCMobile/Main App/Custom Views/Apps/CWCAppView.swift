//
//  AppView.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/27/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AppView: UICollectionView {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        configure()
    }
    
    func configure() {
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
