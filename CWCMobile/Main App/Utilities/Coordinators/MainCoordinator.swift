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
    fileprivate lazy var daysVC = DaysVC(coordinator: self)
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
    
    func didSelectDay(day: Day) {
        let child = DayDetailCoordinator(navigationController: navigationController, day: day)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
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
        navigationController.popToViewController(daysVC, animated: true)
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
        UIApplication.shared.open(url)
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
        navigationController.pushViewController(daysVC, animated: true)
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.delegate = self
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = Theme.chrisBlueNavigation
            navigationController.navigationBar.standardAppearance = navBarAppearance
            navigationController.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
        
        let settingsButton = UIBarButtonItem(image: #imageLiteral(resourceName: "settings").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleSettings))
        settingsButton.tintColor = .white
        daysVC.navigationItem.rightBarButtonItem = settingsButton
    }
    
    fileprivate func displayApps() {
        navigationController.setNavigationBarHidden(false, animated: true)
        daysVC.removeTransitionView()
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let daysDetailVC = fromViewController as? DayDetailVC {
            childDidFinish(daysDetailVC.coordinator)
        }
    }
}
