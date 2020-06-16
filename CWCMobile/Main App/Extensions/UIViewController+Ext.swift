//
//  UIViewController+Ext.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/16/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String, buttonTitle: String) {
        
        DispatchQueue.main.async {
            let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
