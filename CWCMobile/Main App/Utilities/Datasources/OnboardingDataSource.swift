//
//  OnboardingDataSource.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class OnboardingDataSource: NSObject, UICollectionViewDataSource {
    
    private let pages = Page.loadPages()
    
    var numberOfPages: Int {
        return pages.count
    }
    
    weak var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator?) {
        self.coordinator = coordinator
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = pages[indexPath.item].cellType.rawValue
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType, for: indexPath) as? PageCell else { return UICollectionViewCell() }
        
        let page = pages[indexPath.item]
        cell.page = page
        
        if let startCell = cell as? StartPageCell {
            startCell.startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        }
        
        return cell
    }
    
    @objc fileprivate func startButtonPressed() {
        coordinator?.startButtonPressed()
    }
}
