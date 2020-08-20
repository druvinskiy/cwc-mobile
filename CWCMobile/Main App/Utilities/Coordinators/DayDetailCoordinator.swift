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
    var navigationController: CWCNavigationController
    
    var day: Day

    init(navigationController: CWCNavigationController, day: Day) {
        self.navigationController = navigationController
        self.day = day
    }
    
    func start() {
        if let page = day.page {
            let dayProgressionVC = PageVC(page: page, startHandler: didTapStartButton, backHandler: didTapBackButton)
            navigationController.pushViewController(dayProgressionVC, animated: true)
            return
        }
        
        pushDayDetailVC()
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
        let answerPopupVC = AnswerResponsePopupVC()
        answerPopupVC.modalPresentationStyle = .overCurrentContext
        navigationController.present(answerPopupVC, animated: true) {
            answerPopupVC.setPopup(with: answer)
        }
    }
    
    // MARK: - Fileprivate
    
    @objc fileprivate func didTapStartButton() { pushDayDetailVC() }
    
    @objc fileprivate func didTapBackButton() {
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.popToRootViewController(animated: true)
    }
    
    fileprivate func pushDayDetailVC() {
        let dayDetailVC = DayDetailVC(day: day)
        dayDetailVC.coordinator = self
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.navigationBar.tintColor = .white
        navigationController.pushViewController(dayDetailVC, animated: true)
    }
}
