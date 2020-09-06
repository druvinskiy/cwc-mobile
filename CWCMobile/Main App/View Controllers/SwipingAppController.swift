//
//  BaseAppController.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/28/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class SwipingAppController: UIViewController, Storyboarded {
    
    weak var coordinator: AppsCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTwoFingerSwipeGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func addTwoFingerSwipeGesture() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        gesture.direction = .down
        gesture.numberOfTouchesRequired = 2
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    @objc fileprivate func handleSwipe() {
        let coordinator = self.coordinator ?? (tabBarController as? PhotoTabBarController)?.coordinator
        coordinator?.didSwipeDown()
    }
}

extension SwipingAppController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
