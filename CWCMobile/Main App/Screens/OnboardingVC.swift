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
        
        collectionView.dataSource = dataSource
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        transitionView.removeFromSuperview()
    }
    
    override func loadView() {
        super.loadView()
        
        collectionView = onboardingView
        setupCollectionView()
        setupTransitionView()
    }
    
    func setupTransitionView() {
        onboardingView.addSubview(transitionView)
        transitionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    func setupCollectionView() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: Page.CellType.app.rawValue)
        collectionView.register(StartPageCell.self, forCellWithReuseIdentifier: Page.CellType.start.rawValue)
    }
}
