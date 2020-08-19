//
//  AppsCoordinator.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/19/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AppsCoordinator: Coordinator {
    weak var parentCoordinator: SettingsCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    fileprivate var specificAppVC = SwipingAppController()
    var appsVC: AppsVC!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        appsVC = AppsVC(coordinator: self)
        navigationController.pushViewController(appsVC, animated: true)
    }
    
    func didSelectApp(app: App) {
        let appName = AppName(rawValue: app.name)
        
        switch appName {
        case .war:
            specificAppVC = WarViewController.instantiate()
        case .match:
            specificAppVC = MatchViewController.instantiate()
        case .quiz:
            specificAppVC = QuizViewController.instantiate()
        case .news:
            specificAppVC = NewsViewController.instantiate()
        case .photo:
            setupPhotoApp()
            return
        case .guidebook:
            navigationController.presentAlert(title: "Coming Soon", message: Messages.comingSoon, buttonTitle: "OK")
            return
        case .none:
            break
        }
        
        specificAppVC.coordinator = self
        navigationController.pushViewController(specificAppVC, animated: true)
    }
    
    func didSwipeDown() {
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.popToViewController(appsVC, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.navigationController.navigationBar.sizeToFit()
        }
    }
    
    fileprivate func setupPhotoApp() {
        let loginVC = LoginViewController.instantiate()
        loginVC.coordinator = self
        
        guard LocalStorageService.loadUser() != nil else {
            specificAppVC = LoginViewController.instantiate()
            specificAppVC.coordinator = self
            navigationController.pushViewController(specificAppVC, animated: true)
            return
        }
        
        let tabBarVC = PhotoTabBarController.instantiate()
        tabBarVC.loginVC = loginVC
        tabBarVC.set(coordinator: self)
        navigationController.pushViewController(tabBarVC, animated: true)
    }
}
