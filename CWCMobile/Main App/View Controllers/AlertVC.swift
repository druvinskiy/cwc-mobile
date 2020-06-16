//
//  CWCAlertVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/16/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {
    
    let containerView = AlertContainerView()
    
    let titleLabel: UILabel = {
        let label = UILabel(text: "", font: .systemFont(ofSize: 20, weight: .bold))
        label.textAlignment = .center
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(title: "OK", cornerRadius: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Theme.chrisBlue
        return button
    }()
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubview(containerView)
        containerView.addSubViews(titleLabel, actionButton, messageLabel)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    func configureContainerView() {
        containerView.centerInSuperview()
        containerView.constrainWidth(constant: 275)
    }
    
    func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        titleLabel.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: nil, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: padding, right: padding), size: .init(width: 0, height: 28))
    }
    
    func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        actionButton.anchor(top: nil, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: padding, right: padding), size: .init(width: 0, height: 44))
    }
    
    func configureMessageLabel() {
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 0
        
        messageLabel.anchor(top: titleLabel.bottomAnchor, leading: containerView.leadingAnchor, bottom: actionButton.topAnchor, trailing: containerView.trailingAnchor, padding: .init(top: padding, left: padding, bottom: padding, right: padding))
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
