//
//  CameraViewController.swift
//  photoapp
//
//  Created by Christopher Ching on 2020-03-30.
//  Copyright © 2020 Christopher Ching. All rights reserved.
//

import UIKit

class CameraViewController: SwipingAppController {

    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var photoCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Hide and reset all elements
        progressBar.alpha = 0
        progressBar.progress = 0
        
        doneButton.alpha = 0
        
        progressLabel.alpha = 0
        
        //  Retrieve photoCounter from UserDefaults
        photoCounter = LocalStorageService.getPhotoCount()
            
    }

    func savePhoto(image: UIImage) {
        
        // Call the photo service to store the photo
        PhotoService.savePhoto(image: image) { (pct) in
            
            DispatchQueue.main.async {
                
                // Update the progress bar
                self.progressBar.alpha = 1
                self.progressBar.progress = Float(pct)
                
                // Update the label
                let roundedPct = Int(pct * 100)
                self.progressLabel.text = "\(roundedPct) %"
                self.progressLabel.alpha = 1
                
                // Check if it's done
                if pct == 1 {
                    
                    self.progressLabel.text = "Upload Completed!"
                    self.doneButton.alpha = 1
                }
                
            }
        }
    
        //  Increment photoCounter and save to UserDefaults
        photoCounter += 1
        LocalStorageService.savePhotoCount(count: photoCounter)
    }

    @IBAction func doneTapped(_ sender: Any) {
        
        // Get a reference to the tab bar controller
        let tabBarVC = self.tabBarController as? PhotoTabBarController
        
        if let tabBarVC = tabBarVC {
            
            // Call go to feed
            tabBarVC.goToFeed()
        }
    }
}
