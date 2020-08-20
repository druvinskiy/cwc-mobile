//
//  PageVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/17/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class PageVC: UIViewController {
    var page: MainAppPage! {
        didSet {
            topImageView.image = UIImage(named: page.imageName)
            
            let attributedText = NSMutableAttributedString(string: page.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    let topImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "war"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
    }()
    
    let startButton: UIButton = {
        let button = UIButton(title: "Start", cornerRadius: 10)
        
        button.backgroundColor = Theme.chrisBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton(title: "Go Back")
        button.setTitleColor(.gray, for: .normal)
        
        return button
    }()
    
    let startHandler: () -> Void
    let backHandler: () -> Void
    
    init(page: MainAppPage, startHandler: @escaping () -> Void, backHandler: @escaping () -> Void) {
        self.startHandler = startHandler
        self.backHandler = backHandler
        
        super.init(nibName: nil, bundle: nil)
        
        setPage(page: page)
    }
    
    private func setPage(page: MainAppPage) {
        self.page = page
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureImageViewAndTextView()
        configureButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configureImageViewAndTextView() {
        let topImageContainerView = UIView()
        
        view.addSubview(topImageContainerView)
        view.addSubview(descriptionTextView)
        view.addSubview(startButton)
        
        topImageContainerView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        topImageContainerView.addSubview(topImageView)
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        topImageView.centerInSuperview()
        topImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.7).isActive = true
        
        descriptionTextView.anchor(top: topImageContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
    }
    
    func configureButtons() {
        
        let stackView = VerticalStackView(arrangedSubviews: [
            startButton,
            backButton
        ], spacing: 4)
        
        view.addSubview(stackView)
        
        startButton.constrainWidth(constant: 200)
        startButton.constrainHeight(constant: 50)
        
        stackView.anchor(top: descriptionTextView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        stackView.centerXInSuperview()
        
        startButton.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    }
    
    @objc fileprivate func handleStart() {
        startHandler()
    }
    
    @objc fileprivate func handleBack() {
        backHandler()
    }
}
