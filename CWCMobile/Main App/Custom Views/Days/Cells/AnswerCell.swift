//
//  AnswerCell.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/11/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    static let answerCellId = "answerCellId"
    
    let answerLabel: UILabel = {
        let label = UILabel(text: "Test", font: .systemFont(ofSize: 18), numberOfLines: 0)
//        label.textColor = .black
        return label
    }()
    
    let answerView: UIView = {
        let view = UIView()
        view.backgroundColor = UserInterface.isDarkMode() ? Theme.chrisBlueDark : Theme.chrisBlueLight
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(answerView)
        answerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 2, left: 10, bottom: 2, right: 10))
        
        answerView.addSubview(answerLabel)
        answerLabel.centerYInSuperview()
        answerLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 22, bottom: 0, right: 22))
    }
}
