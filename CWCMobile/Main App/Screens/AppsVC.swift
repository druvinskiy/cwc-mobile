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
    
    let headerId = "headerId"
    
    var videos = [Video]()
    
    init(coordinator: MainCoordinator?) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Apps"
        loadVideos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        collectionView.reloadData()
        
        FloatingContainerView.hasBeenShown(false)
        
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.navigationBar.sizeToFit()
        }
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
    
    func removeTransitionView() {
        transitionView.removeFromSuperview()
    }
    
    func setupTransitionView() {
        appView.addSubview(transitionView)
        transitionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    func setupCollectionView() {
        collectionView.register(ImageAppCell.self, forCellWithReuseIdentifier: ImageApp.CellType.image.rawValue)
        collectionView.register(ColorAppCell.self, forCellWithReuseIdentifier: ImageApp.CellType.color.rawValue)
        collectionView.register(VideosPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView.dataSource = dataSource
    }
    
    func loadVideos() {
        let result = Bundle.main.decode("videos.json") as VideoData
        videos = result.videos
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
        return .init(top: 32, left: 0, bottom: 32, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
