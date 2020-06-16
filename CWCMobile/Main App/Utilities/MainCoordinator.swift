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
    var rootViewController: UIViewController
    var navigationController: UINavigationController
    
    init(with viewController: UIViewController) {
        self.rootViewController = viewController
        navigationController = UINavigationController()
    }
    
    func displayApps() {
        configureNavigationController()
        rootViewController.present(navigationController, animated: true)
    }
    
    var appVC: AppsVC!
    
    fileprivate func configureNavigationController() {
        appVC = AppsVC(coordinator: self)
        navigationController = UINavigationController(rootViewController: appVC)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.delegate = self
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
            appVC.presentAlert(title: "Coming Soon", message: AlertMessage.comingSoon, buttonTitle: "OK")
            return
        case .none:
            break
        }
        
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func didSwipeDown() {
        navigationController.popToViewController(appVC, animated: true)
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        if !(viewController is AppsVC) { return }
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
