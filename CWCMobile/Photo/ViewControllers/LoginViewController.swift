//
//  LoginViewController.swift
//  photoapp
//
//  Created by Christopher Ching on 2020-03-30.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginViewController: SwipingAppController, Floatable {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isMovingToParent { sendFloatingViewUp() }
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        // Create a Firebase AuthUI obj
        let authUI = FUIAuth.defaultAuthUI()
        
        // Check that is isn't nil
        if let authUI = authUI {
            
            // Set self as delegate for the authUI
            authUI.delegate = self
            
            // Set sign in providers
            authUI.providers = [FUIEmailAuth()]
            
            // Get the prebuilt UI view controller
            let authViewController = authUI.authViewController()
            authViewController.modalPresentationStyle = .overFullScreen
            
            // Present it
            present(authViewController, animated: true, completion: nil)
        }
    }
}

extension LoginViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        if error != nil {
            // There was an error
            return
        }
        
        let user = authDataResult?.user
        
        if let user = user {
            
            // Got a user
            // Check on the database side if user has a profile
            UserService.retrieveProfile(userId: user.uid) { [weak self] (user) in
                
                guard let self = self else { return }
                
                // Check if user is nil
                if user == nil {
                    // If not, go to create profile view controller
                    let createProfileVC = CreateProfileViewController.instantiate()
                    createProfileVC.coordinator = self.coordinator
                    self.navigationController?.pushViewController(createProfileVC, animated: true)
                } else {
                    // If so, go to tab bar controller
                    
                    // Save user to local storage
                    LocalStorageService.saveUser(userId: user!.userId, username: user!.username)
                    
                    // Create an instance of the tab bar controller
                    let tabBarVC = PhotoTabBarController.instantiate()
                    tabBarVC.coordinator = self.coordinator
                    tabBarVC.loginVC = self
                    self.navigationController?.pushViewController(tabBarVC, animated: true)
                }
            } 
        }
        
    }
    
}
