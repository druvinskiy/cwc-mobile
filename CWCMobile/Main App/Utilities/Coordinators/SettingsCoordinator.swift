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
    var navigationController: CWCNavigationController
    var settingsNavigationController: CWCNavigationController!
    let settingsVC = SettingsVC()

    init(navigationController: CWCNavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        settingsVC.coordinator = self
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismiss))
        settingsVC.navigationItem.rightBarButtonItem = doneButton
        
        settingsNavigationController = CWCNavigationController(rootViewController: settingsVC)
        settingsNavigationController.navigationBar.prefersLargeTitles = true
        settingsNavigationController.modalPresentationStyle = .fullScreen
        UINavigationBar.appearance().tintColor = Theme.chrisBlue
        
        navigationController.present(settingsNavigationController, animated: true)
    }
    
    func replayWalkthroughPressed() {
        dismiss()
        parentCoordinator?.replayWalkthroughPressed()
    }
    
    func browseAppsPressed() {
        let child = AppsCoordinator(navigationController: settingsNavigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        settingsVC.navigationItem.title = "Back"
        child.start()
    }
    
    // MARK: - Fileprivate
    
    @objc fileprivate func dismiss() {
        UINavigationBar.appearance().tintColor = UIColor.white
        navigationController.dismiss(animated: true)
        parentCoordinator?.childDidFinish(self)
    }
}
