//
//  MainCoordinator.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    fileprivate lazy var appsVC = AppsVC(coordinator: self)
    fileprivate var specificAppVC = SwipingAppController()
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        configureNavigationController()
        
        let firstLaunch = FirstLaunch.alwaysFirst()
        if firstLaunch.isFirstLaunch { displayOnboarding(addTransitionView: true) } else { displayApps() }
    }
    
    func startButtonPressed() {
        navigationController.dismiss(animated: true)
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
        case .guidebook:
            navigationController.presentAlert(title: "Coming Soon", message: AlertMessage.comingSoon, buttonTitle: "OK")
            return
        case .none:
            break
        }
        
        specificAppVC.coordinator = self
        navigationController.pushViewController(specificAppVC, animated: true)
    }
    
    func didSwipeDown() {
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.popToViewController(appsVC, animated: true)
    }
    
    func replayWalkthroughPressed() {
        displayOnboarding(addTransitionView: false)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
    
    // MARK: - Fileprivate
    
    fileprivate func setupPhotoApp() {
        let loginVC = LoginViewController.instantiate()
        loginVC.coordinator = self
        
        guard LocalStorageService.loadUser() != nil else {
            specificAppVC = LoginViewController.instantiate()
            return
        }
        
        let tabBarVC = PhotoTabBarController.instantiate()
        tabBarVC.loginVC = loginVC
        tabBarVC.set(coordinator: self)
        navigationController.pushViewController(tabBarVC, animated: true)
    }
    
    @objc fileprivate func handleSettings() {
        let child = SettingsCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    fileprivate func displayOnboarding(addTransitionView: Bool) {
        let onboardingVC = addTransitionView ? TransitionOnboardingVC() : OnboardingVC()
        onboardingVC.modalPresentationStyle = .fullScreen
        onboardingVC.coordinator = self
        
        navigationController.present(onboardingVC, animated: true) { self.displayApps() }
    }
    
    fileprivate func configureNavigationController() {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(appsVC, animated: true)
        
        let settingsButton = UIBarButtonItem(image: #imageLiteral(resourceName: "settings").withTintColor(Theme.chrisBlue!), style: .plain, target: self, action: #selector(handleSettings))
        appsVC.navigationItem.rightBarButtonItem = settingsButton
    }
    
    fileprivate func displayApps() {
        navigationController.setNavigationBarHidden(false, animated: true)
        appsVC.removeTransitionView()
    }
}
