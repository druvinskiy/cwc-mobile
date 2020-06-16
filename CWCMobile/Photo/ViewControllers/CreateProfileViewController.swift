//
//  CreateProfileViewController.swift
//  photoapp
//
//  Created by Christopher Ching on 2020-03-30.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateProfileViewController: SwipingAppController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    var savedUserIds: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        savedUserIds = LocalStorageService.getSavedUserIds()
    }

    @IBAction func confirmTapped(_ sender: Any) {
        
        // Check that there is a user logged in
        guard Auth.auth().currentUser != nil else {
            
            // No user logged in
            return
        }
        
        // Get the username
        // Check it against whitespaces, new lines, illegal character etc
        let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check that the username isn't nil
        if username == nil || username == "" {
            
            // Show an error message
            return
        }
        
        // Call the user service to create the profile
        UserService.createProfile(userId: Auth.auth().currentUser!.uid, username: username!) { [weak self] (user) in
            
            guard let self = self else { return }
            
            // Check if it was created successfully
            if user != nil {
                // If so, go to the tab bar controller
                
                // Save the user to local storage
                LocalStorageService.saveUser(userId: user!.userId, username: user!.username)
                
                self.savedUserIds?.append(user!.userId!)
                LocalStorageService.saveUserIds(userIds: self.savedUserIds!)
                
                let tabBarVC = PhotoTabBarController.instantiate()
                tabBarVC.coordinator = self.coordinator
                self.navigationController?.pushViewController(tabBarVC, animated: true)
                
            } else {
                // If not, display error
            }
        }
    }
}
