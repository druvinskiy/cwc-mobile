//
//  OnboardingView.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/23/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class CWCOnboardingView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    var numberOfPages = 0
    lazy var pageControl = CWCPageControl(numberOfPages: numberOfPages)
    
    private let previousButton: UIButton = {
        let button = CWCOnboardingButton(title: "PREV")
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        updatePagingButtonsVisibility()
        scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = CWCOnboardingButton(title: "NEXT")
        button.setTitleColor(Theme.chrisBlue, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, numberOfPages - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        updatePagingButtonsVisibility()
        scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func updatePagingButtonsVisibility() {
        switch pageControl.currentPage {
        case 0:
            hideButton(previousButton)
        case numberOfPages - 1:
            hideButton(nextButton)
        default:
            showButton(previousButton)
            showButton(nextButton)
        }
    }
    
    func hideButton(_ pageButton: UIButton) {
            pageButton.layer.opacity = 0
    }
    
    func showButton(_ pageButton: UIButton) {
            pageButton.layer.opacity = 1
    }
    
    init(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        configure()
        createSubviews()
        updatePagingButtonsVisibility()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        isPagingEnabled = true
        delegate = self
    }
    
    private func createSubviews() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.distribution = .fillEqually
        addSubview(bottomControlsStackView)
        
        bottomControlsStackView.anchor(top: nil, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .zero, size: .init(width: 0, height: 50))
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / frame.width)
        updatePagingButtonsVisibility()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
