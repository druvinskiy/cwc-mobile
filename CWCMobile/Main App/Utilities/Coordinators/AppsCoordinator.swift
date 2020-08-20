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
    var navigationController: CWCNavigationController
    fileprivate var specificAppVC = SwipingAppController()
    fileprivate var appsVC: AppsVC!
    
    init(navigationController: CWCNavigationController) {
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
            let pageVC = PageVC(page: app.page, startHandler: setupPhotoApp, backHandler: didTapBackButton)
            navigationController.pushViewController(pageVC, animated: true)
            return
        case .guidebook:
            navigationController.presentAlert(title: "Coming Soon", message: Messages.comingSoon, buttonTitle: "OK")
            return
        case .none:
            break
        }
        
        let pageVC = PageVC(page: app.page, startHandler: pushSpecificAppVC, backHandler: didTapBackButton)
        navigationController.pushViewController(pageVC, animated: true)
    }
    
    func didSwipeDown() {
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.popToViewController(appsVC, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.navigationController.navigationBar.sizeToFit()
        }
    }
    
    // MARK: - Fileprivate
    
    @objc fileprivate func pushSpecificAppVC() {
        specificAppVC.coordinator = self
        navigationController.pushViewController(self.specificAppVC, animated: true)
    }
    
    @objc fileprivate func didTapBackButton() {
        didSwipeDown()
    }
    
    @objc fileprivate func setupPhotoApp() {
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
