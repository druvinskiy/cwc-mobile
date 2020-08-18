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
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
    }
    
    override func loadView() {
        super.loadView()
        
        collectionView = onboardingView
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: OnboardingPage.CellType.app.rawValue)
        collectionView.register(StartPageCell.self, forCellWithReuseIdentifier: OnboardingPage.CellType.start.rawValue)
    }
}

class TransitionOnboardingVC: OnboardingVC {
    lazy var transitionView = TransitionView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        transitionView.removeFromSuperview()
    }
    
    override func loadView() {
        super.loadView()
        
        setupTransitionView()
    }
    
    func setupTransitionView() {
        onboardingView.addSubview(transitionView)
        transitionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
