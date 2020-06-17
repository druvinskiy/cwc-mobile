//
//  FloatingContainerView.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/28/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class FloatingContainerView: UIView {
    
    static var hasNotBeenShown = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = true
        layer.cornerRadius = 16
        
        backgroundColor = .darkGray
        
        let imageView = UIImageView(cornerRadius: 16)
        imageView.image = #imageLiteral(resourceName: "fingerSwipe").withTintColor(.white)
        imageView.constrainHeight(constant: 68)
        imageView.constrainWidth(constant: 68)
        
        let label = UILabel(text: "Swipe down with two fingers to go back.", font: .systemFont(ofSize: 18), numberOfLines: 0)
        label.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            label
        ], customSpacing: 16)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        stackView.alignment = .center
    }
    
    func sendUp(numberToSubtractFrom: CGFloat) {
        let statusBarFrame = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        let translationY = numberToSubtractFrom - statusBarFrame.height
        let transform = CGAffineTransform(translationX: 0, y: translationY)
        
        animate(transform: transform)
        sendDown()
    }
    
    fileprivate func sendDown() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.animate(transform: .identity)
        }
    }
    
    fileprivate func animate(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            self.transform = transform
        })
    }
}
