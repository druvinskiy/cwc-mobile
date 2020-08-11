//
//  DayCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/24/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class DayCell: UICollectionViewCell {
    var day: Day! {
        didSet {
            numberLabel.text = "Day \(day.number)"
            subtitleLabel.text = day.subtitle
            thumbnailImageView.image = UIImage(named: "Video_\(day.number)")
            descriptionLabel.text = day.description
            
            let color = (day.number % 2 == 0) ? Theme.rowLight : Theme.rowDark
            backgroundColor = color
            backgroundView?.backgroundColor = color
        }
    }
    
    let numberLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 20))
    let subtitleLabel = UILabel(text: "", font: .boldSystemFont(ofSize: 28), numberOfLines: 0)
    let thumbnailImageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
    
    static let dayCellId = "dayCellId"
    
    let descriptionLabel: UILabel = {
        let label = UILabel(text: "Tap Me", font: .boldSystemFont(ofSize: 18), numberOfLines: 0)
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
        self.backgroundView = DayCellBackgroundView()
        addSubview(self.backgroundView!)
        self.backgroundView?.fillSuperview()
        
        thumbnailImageView.contentMode = .scaleAspectFit
        thumbnailImageView.clipsToBounds = true
        let imageContainerView = UIView()
        imageContainerView.addSubview(thumbnailImageView)
        thumbnailImageView.centerInSuperview(size: .init(width: 300, height: 300))
        
        let stackView = VerticalStackView(arrangedSubviews: [
            numberLabel,
            subtitleLabel,
            imageContainerView,
            descriptionLabel
        ], spacing: 8)
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        let topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        topConstraint.isActive = true
        
        subtitleLabel.textColor = .darkText
        numberLabel.textColor = Theme.chrisBlue
        descriptionLabel.textColor = .darkText
    }
}
