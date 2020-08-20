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
    internal var navigationController: CWCNavigationController
    fileprivate lazy var daysVC = DaysVC(coordinator: self)
    
    init(navigationController: CWCNavigationController) {
        
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
        navigationController.statusBarStyle = .lightContent
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
