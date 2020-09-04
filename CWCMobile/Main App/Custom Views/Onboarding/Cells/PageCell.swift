//
//  PageCell.swift
//  autolayout_lbta
//
//  Created by Brian Voong on 10/12/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page: OnboardingPage? {
        didSet {
            guard let unwrappedPage = page else { return }
            
            topImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UserInterface.isDarkMode() ? UIColor.white : UIColor.black])
            
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UserInterface.isDarkMode() ? UIColor.lightGray : UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let topImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "war"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UserInterface.isDarkMode() ? UIColor.white : UIColor.black])
        
        attributedText.append(NSAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UserInterface.isDarkMode() ? UIColor.lightGray : UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    func setupLayout() {
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        addSubview(descriptionTextView)
        
        topImageContainerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        topImageContainerView.addSubview(topImageView)
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        topImageView.centerInSuperview()
        topImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.7).isActive = true
        
        descriptionTextView.anchor(top: topImageContainerView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
