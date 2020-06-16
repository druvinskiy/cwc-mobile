//
//  SettingsViewController.swift
//  photoapp
//
//  Created by Christopher Ching on 2020-03-30.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingsViewController: SwipingAppController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        
        do {
            
            // Try to sign out the user
            try Auth.auth().signOut()
            
            // Clear local storage
            LocalStorageService.clearUser()
            
            // Transition to authentication flow
            
            if let loginVC = navigationController?.viewControllers.first(where: { $0 is LoginViewController }) {
                navigationController?.popToViewController(loginVC, animated: true)
            } else if let loginVC = (tabBarController as? PhotoTabBarController)?.loginVC {
                navigationController?.viewControllers.insert(loginVC, at: 1)
                navigationController?.popToViewController(loginVC, animated: true)
            }
        } catch {
            // Couldn't sign out the user
        }
    }
}
