//
//  AnswerResponsePopupVC.swift
//  CWCMobile
//
//  Created by Chris Parker on 15/8/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AnswerResponsePopupVC: UIViewController {
    
    let containerView = AnswerResponseContainerView()
    let dialogView = UIView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = .white
        return label
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    let feedbackLabel: UILabel = {
        let label = UILabel(text: "", font: .systemFont(ofSize: 18), numberOfLines: 0)
        label.textAlignment = .center
        return label
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton(title: "", cornerRadius: 10)
        
        button.backgroundColor = Theme.chrisBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(containerView)
        dialogView.addSubview(feedbackLabel)
        view.addSubViews(dialogView, titleView, dismissButton)
        titleView.addSubview(titleLabel)
        
        configureContainer()
        configureDialogView()
        configureTitleView()
        configureTitleLabel()
        configureFeedbackLabel()
        configureDismissButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.containerView.alpha = 0.5
        })
    }
    
    private func configureContainer() {
        containerView.fillSuperview()
        containerView.backgroundColor = UIColor.black
        containerView.alpha = 0
    }
    
    private func configureDialogView() {
        dialogView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 100, left: 40, bottom: 100, right: 40))
        dialogView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        dialogView.layer.cornerRadius = 16
    }
    
    private func configureTitleView() {
        titleView.anchor(top: dialogView.topAnchor, leading: dialogView.leadingAnchor, bottom: nil, trailing: dialogView.trailingAnchor, size: .init(width: 0, height: 100))
    }
    
    private func configureTitleLabel() {
        titleLabel.centerInSuperview()
        titleLabel.alpha = 0
    }
    
    private func configureFeedbackLabel() {
        feedbackLabel.centerXInSuperview()
        feedbackLabel.centerYInSuperview()
        feedbackLabel.anchor(top: nil, leading: dialogView.leadingAnchor, bottom: nil, trailing: dialogView.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        feedbackLabel.alpha = 0
    }
    
    private func configureDismissButton() {
        dismissButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        dismissButton.anchor(top: nil, leading: nil, bottom: dialogView.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0), size: .init(width: 200, height: 50))
        dismissButton.centerXInSuperview()
        dismissButton.alpha = 0
    }
    
    func setPopup(with answer: Answer) {
        titleLabel.text = answer.title
        feedbackLabel.text = answer.feedback
        dismissButton.setTitle(answer.action, for: .normal)
        titleView.backgroundColor = answer.isCorrect ? .systemGreen : .systemRed
        
        //Fade in the labels
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            
            self.titleLabel.alpha = 1
            self.feedbackLabel.alpha = 1
            self.dismissButton.alpha = 1
            
        }, completion: nil)
    }
    
    @objc func dismissVC() {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.containerView.alpha = 0
        }, completion: { _ in
            self.titleLabel.text = ""
            self.feedbackLabel.text = ""
            self.dismiss(animated: true)
        })
    }
}
