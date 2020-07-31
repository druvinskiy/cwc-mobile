//
//  MainCoordinator.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit
import SafariServices

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
        
        let firstLaunch = FirstLaunch(userDefaults: .standard, key: Keys.onboardingKey)
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
            return
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
        navigationController.popToViewController(appsVC, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.navigationController.navigationBar.sizeToFit()
        }
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
    
    func didSelectVideo(video: Video) {
        guard let url = URL(string: video.videoUrl) else { return }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = Theme.chrisBlue
        navigationController.present(safariVC, animated: true)
    }
    
    // MARK: - Fileprivate
    
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
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(appsVC, animated: true)
        
        let settingsButton = UIBarButtonItem(image: #imageLiteral(resourceName: "settings").withTintColor(Theme.chrisBlue), style: .plain, target: self, action: #selector(handleSettings))
        appsVC.navigationItem.rightBarButtonItem = settingsButton
    }
    
    fileprivate func displayApps() {
        navigationController.setNavigationBarHidden(false, animated: true)
        appsVC.removeTransitionView()
    }
}
