//
//  ViewController.swift
//  WarApp
//
//  Created by David Ruvinskiy on 5/29/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import UIKit

class WarViewController: SwipingAppController, Floatable {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sendFloatingViewUp()
    }
    
    @IBAction func dealTapped(_ sender: Any) {
        let leftRandomNumber = arc4random_uniform(13) + 2
        let rightRandomNumber = arc4random_uniform(13) + 2
        
        leftImageView.image = UIImage(named: "warCard\(leftRandomNumber)")
        rightImageView.image = UIImage(named: "warCard\(rightRandomNumber)")
        
        if leftRandomNumber > rightRandomNumber {
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
        } else if rightRandomNumber > leftRandomNumber {
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
        } else if leftRandomNumber == rightRandomNumber {}
    }
}
