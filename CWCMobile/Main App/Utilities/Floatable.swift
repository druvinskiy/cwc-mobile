//
//  Floatable.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/14/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

protocol Floatable {
    func sendFloatingViewUp(numberToSubtractFrom: CGFloat)
}

extension Floatable where Self: UIViewController {
    
    func setupFloatingView() {
        let floatingContainerView = FloatingContainerView()
        view.addSubview(floatingContainerView)
        floatingContainerView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: -90, right: 16), size: .init(width: 0, height: 90))
    }
    
    func sendFloatingViewUp(numberToSubtractFrom: CGFloat = -90) {
        setupFloatingView()
        guard let floatingContainerView = view.subviews.first(where: { $0 is FloatingContainerView }) as? FloatingContainerView else { return }
        floatingContainerView.sendUp(numberToSubtractFrom: numberToSubtractFrom)
    }
}
