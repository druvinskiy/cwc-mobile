//
//  DaysVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class DaysVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, DataLoader {
    
    weak var coordinator: MainCoordinator?
    
    var appView = AppView()
    var transitionView = TransitionView()
    var containerView: UIView! = UIView()
    
    fileprivate var days = [Day]()
    lazy var dataSource = DaysDataSource(days: days)
    
    init(coordinator: MainCoordinator?) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.coordinator = coordinator
        
        dataSource.videoDidSelectHandler = { [weak self] video in
            guard let self = self else { return }
            
            self.coordinator?.didSelectVideo(video: video)
        }
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
        getDays()
    }
    
    func setupTransitionView() {
        appView.addSubview(transitionView)
        transitionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    func setupCollectionView() {
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.dayCellId)
        collectionView.dataSource = dataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let day = days[indexPath.row]
        coordinator?.didSelectDay(day: day)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width - 64, height: 455)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 40)
    }
    
    let multiplier: CGFloat = 0.47
    
    func getDays() {
        let dayModel = DayModel()
        dayModel.delegate = self
        
        guard let containerView = containerView else { return }
        
        showLoadingView(containerView: containerView)
        dayModel.loadDays()
    }
}

extension DaysVC: DayProtocol {
    func daysRetrieved(days: [Day]) {
        DispatchQueue.main.async {
            self.dismissLoadingView(containerView: self.containerView)
            self.containerView = nil
            
            self.days = days
            self.dataSource.days = days
            self.collectionView.reloadData()
        }
    }
}
