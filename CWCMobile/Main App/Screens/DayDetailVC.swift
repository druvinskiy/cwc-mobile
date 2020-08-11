//
//  DayDetailVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/10/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit
import AVKit

class DayDetailVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    weak var coordinator: MainCoordinator?
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
        
        return .init(width: view.frame.width, height: 210)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let videoURL = URL(string: day.video.videoUrl) else { return }
        
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        player.play()

        present(playerViewController, animated: true)
    }
}
