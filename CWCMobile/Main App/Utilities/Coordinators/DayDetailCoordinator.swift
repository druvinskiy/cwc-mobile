//
//  DayDetailCoordinator.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/11/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit
import AVKit

class DayDetailCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var day: Day

    init(navigationController: UINavigationController, day: Day) {
        self.navigationController = navigationController
        self.day = day
    }
    
    func start() {
        let dayDetailVC = DayDetailVC(day: day)
        dayDetailVC.coordinator = self
        navigationController.navigationBar.tintColor = .white
        navigationController.pushViewController(dayDetailVC, animated: true)
    }
    
    func didSelectVideo() {
        guard let videoURL = URL(string: day.video.videoUrl) else { return }
        
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        player.play()

        navigationController.present(playerViewController, animated: true)
    }
    
    func didSelectAnswer(answer: Answer) {
        
    }
}
