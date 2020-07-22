//
//  BaseAppCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class BaseAppCell: UICollectionViewCell {
    var app: App! {
        didSet {
            courseLabel.text = app.course
            nameLabel.text = app.name
            logoImageView.image = app.image
        }
    }
    
    let courseLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 20))
    let nameLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 28))
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
    
    let tapLabel: UILabel = {
        let label = UILabel(text: "Tap to Try This App", font: .boldSystemFont(ofSize: 20))
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            
            var transform: CGAffineTransform = .identity
            
            if isHighlighted {
                transform = .init(scaleX: 0.9, y: 0.9)
            }
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.transform = transform
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        layer.cornerRadius = 16
    }
    
    func addSubviews() {
        self.backgroundView = AppCellBackgroundView()
        addSubview(self.backgroundView!)
        self.backgroundView?.fillSuperview()
        
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.clipsToBounds = true
        let imageContainerView = UIView()
        imageContainerView.addSubview(logoImageView)
        logoImageView.centerInSuperview(size: .init(width: 240, height: 240))
        
        let stackView = VerticalStackView(arrangedSubviews: [
            courseLabel,
            nameLabel,
            imageContainerView,
            tapLabel
        ], spacing: 8)
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        let topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        topConstraint.isActive = true
        
        nameLabel.textColor = .white
        courseLabel.textColor = .white
        tapLabel.textColor = .white
        
        courseLabel.layer.shadowColor = UIColor.black.cgColor
        courseLabel.layer.shadowRadius = 2.0
        courseLabel.layer.shadowOpacity = 1.0
        courseLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        courseLabel.layer.masksToBounds = false
        
        nameLabel.layer.shadowColor = UIColor.black.cgColor
        nameLabel.layer.shadowRadius = 2.0
        nameLabel.layer.shadowOpacity = 1.0
        nameLabel.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        nameLabel.layer.masksToBounds = false
        
        tapLabel.layer.shadowColor = UIColor.black.cgColor
        tapLabel.layer.shadowRadius = 2.0
        tapLabel.layer.shadowOpacity = 1.0
        tapLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        tapLabel.layer.masksToBounds = false
    }
}
