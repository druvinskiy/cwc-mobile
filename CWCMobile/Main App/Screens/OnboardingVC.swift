//
//  OnboardingVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class OnboardingVC: UICollectionViewController {
    
    weak var coordinator: MainCoordinator?
    
    lazy var dataSource = OnboardingDataSource(coordinator: coordinator)
    lazy var onboardingView = CWCOnboardingView(numberOfPages: dataSource.numberOfPages)
    lazy var transitionView = TransitionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.transitionView.removeFromSuperview()
        }
        collectionView.dataSource = dataSource
    }
    
    override func loadView() {
        super.loadView()
        
        collectionView = onboardingView
        setupCollectionView()
        setupTransitionView()
    }
    
    func setupTransitionView() {
        onboardingView.addSubview(transitionView)
        NSLayoutConstraint.activate([
            transitionView.topAnchor.constraint(equalTo: view.topAnchor),
            transitionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            transitionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transitionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupCollectionView() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: Page.CellType.app.rawValue)
        collectionView.register(StartPageCell.self, forCellWithReuseIdentifier: Page.CellType.start.rawValue)
    }
}
