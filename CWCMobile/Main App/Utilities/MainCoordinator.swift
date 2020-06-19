//
//  MainCoordinator.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    lazy var appsVC = AppsVC(coordinator: self)
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        
        super.init()
        
        self.navigationController.delegate = self
    }
    
    func start() {
//        let firstLaunch = FirstLaunch(userDefaults: .standard, key: Keys.onboardingKey)
        let firstLaunch = FirstLaunch.alwaysFirst()
        
        self.navigationController.pushViewController(appsVC, animated: true)
        
        if firstLaunch.isFirstLaunch {
            displayOnboarding()
        }
    }
    
    fileprivate func displayOnboarding() {
        let onboardingVC = OnboardingVC(collectionViewLayout: UICollectionViewFlowLayout())
        onboardingVC.modalPresentationStyle = .fullScreen
        onboardingVC.coordinator = self
        
        navigationController.present(onboardingVC, animated: true)
    }
    
    func displayApps() {
        navigationController.dismiss(animated: true)
    }
    
    func didSelectApp(app: App) {
        let appName = AppName(rawValue: app.name)
        var viewController = SwipingAppController()
        
        switch appName {
        case .war:
            viewController = WarViewController.instantiate()
        case .match:
            viewController = MatchViewController.instantiate()
        case .quiz:
            viewController = QuizViewController.instantiate()
        case .news:
            viewController = NewsViewController.instantiate()
        case .photo:
            
            let loginVC = LoginViewController.instantiate()
            loginVC.coordinator = self
            
            guard LocalStorageService.loadUser() != nil else {
                viewController = LoginViewController.instantiate()
                break
            }
            
            let tabBarVC = PhotoTabBarController.instantiate()
            tabBarVC.loginVC = loginVC
            tabBarVC.set(coordinator: self)
            navigationController.pushViewController(tabBarVC, animated: true)
            return
            
        case .guidebook:
            navigationController.presentAlert(title: "Coming Soon", message: AlertMessage.comingSoon, buttonTitle: "OK")
            return
        case .none:
            break
        }
        
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func didSwipeDown() {
        navigationController.popToViewController(appsVC, animated: true)
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if !(viewController is AppsVC) { return }
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
