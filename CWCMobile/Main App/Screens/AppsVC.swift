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
    
    fileprivate let sections = MainApp.loadSections()
    
    init(coordinator: MainCoordinator?) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CodeWithChris Hub"
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
        collectionView.register(ImageAppCell.self, forCellWithReuseIdentifier: ImageAppCell.imageCellId)
        collectionView.register(ColorAppCell.self, forCellWithReuseIdentifier: ColorAppCell.colorCellId)
        collectionView.register(VideoGroupCell.self, forCellWithReuseIdentifier: VideoGroupCell.cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        
        collectionView.dataSource = dataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = sections[indexPath.section].cellItem(at: indexPath.row)
        
        if let appItem = item as? AppItem {
            coordinator?.didSelectApp(app: appItem.getApp())
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = sections[indexPath.section].cellItem(at: indexPath.row)
        
        if item is Video {
            return .init(width: view.frame.width, height: view.frame.width * multiplier)
        }
        
        return .init(width: view.frame.width - 64, height: 500)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 40)
    }
    
    let multiplier: CGFloat = 0.47
}
