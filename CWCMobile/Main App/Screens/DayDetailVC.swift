//
//  DayDetailVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/10/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class DayDetailVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    weak var coordinator: DayDetailCoordinator?
    var day: Day
    
    @objc func canRotate() {}
    
    init(day: Day) {
        self.day = day
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9489166141, green: 0.9490789771, blue: 0.9489063621, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        
        collectionView.register(DayVideoCell.self, forCellWithReuseIdentifier: DayVideoCell.videoCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayVideoCell.videoCellId, for: indexPath) as? DayVideoCell else { return UICollectionViewCell() }
        cell.day = day
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: view.frame.width / 16 * 9)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.didSelectVideo()
    }
}
