//
//  SettingsCoordinator.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/20/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let settingsVC = SettingsVC()
        settingsVC.coordinator = self
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismiss))
        settingsVC.navigationItem.rightBarButtonItem = doneButton
        
        let settingsNavigationController = UINavigationController(rootViewController: settingsVC)
        settingsNavigationController.navigationBar.prefersLargeTitles = true
        settingsNavigationController.modalPresentationStyle = .fullScreen
        UINavigationBar.appearance().tintColor = Theme.chrisBlue
        
        navigationController.present(settingsNavigationController, animated: true)
    }
    
    func replayWalkthroughPressed() {
        dismiss()
        parentCoordinator?.replayWalkthroughPressed()
    }
    
    // MARK: - Fileprivate
    
    @objc fileprivate func dismiss() {
        UINavigationBar.appearance().tintColor = UIColor.white
        navigationController.dismiss(animated: true)
        parentCoordinator?.childDidFinish(self)
    }
}
