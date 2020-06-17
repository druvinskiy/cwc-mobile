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
    
    let firstLaunch = FirstLaunch.alwaysFirst()
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        
        super.init()
        
        self.navigationController.delegate = self
    }
    
    func start() {
        if firstLaunch.isFirstLaunch {
            displayOnboarding()
        } else {
            displayApps()
        }
    }
    
    fileprivate func displayOnboarding() {
        let onboardingVC = OnboardingVC(collectionViewLayout: UICollectionViewFlowLayout())
        onboardingVC.modalPresentationStyle = .fullScreen
        onboardingVC.coordinator = self
        
        navigationController.present(onboardingVC, animated: true)
    }
    
    func displayApps() {
        if firstLaunch.isFirstLaunch {
            navigationController.dismiss(animated: true)
        }
        
        let appsVC = AppsVC(coordinator: self)
        navigationController.pushViewController(appsVC, animated: true)
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
            //appVC.presentAlert(title: "Coming Soon", message: AlertMessage.comingSoon, buttonTitle: "OK")
            return
        case .none:
            break
        }
        
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func didSwipeDown() {
        //navigationController.popToViewController(appVC, animated: true)
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        if !(viewController is AppsVC) { return }
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
