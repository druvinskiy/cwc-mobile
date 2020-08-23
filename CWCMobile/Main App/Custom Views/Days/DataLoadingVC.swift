//
//  DataLoadingVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/22/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

protocol DataLoader {
    
    func showLoadingView(containerView: UIView)
    func dismissLoadingView(containerView: UIView)
}

extension DataLoader where Self: UIViewController {
    
    func showLoadingView(containerView: UIView) {
        view.addSubview(containerView)
        containerView.fillSuperview()
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView(containerView: UIView) {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
        }
    }
}
