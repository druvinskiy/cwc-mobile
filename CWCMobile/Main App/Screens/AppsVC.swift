//
//  AppsVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AppsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    weak var coordinator: MainCoordinator?
    var dataSource = AppsDataSource()
    var appView = CWCAppView()
    var transitionView = TransitionView()
    
    init(coordinator: MainCoordinator?) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigationController?.navigationBar.isHidden = false
            self.title = "Apps"
            self.transitionView.removeFromSuperview()
        }
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        collectionView.reloadData()
        
        FloatingContainerView.hasNotBeenShown = true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func loadView() {
        super.loadView()
        
        collectionView = appView
        setupCollectionView()
        setupTransitionView()
    }
    
    func setupTransitionView() {
        appView.addSubview(transitionView)
        NSLayoutConstraint.activate([
            transitionView.topAnchor.constraint(equalTo: view.topAnchor),
            transitionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            transitionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transitionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupCollectionView() {
        collectionView.register(ImageAppCell.self, forCellWithReuseIdentifier: ImageApp.CellType.image.rawValue)
        collectionView.register(ColorAppCell.self, forCellWithReuseIdentifier: ImageApp.CellType.color.rawValue)
        collectionView.dataSource = dataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.didSelectApp(app: dataSource.app(at: indexPath.item))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width - 64, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
}
