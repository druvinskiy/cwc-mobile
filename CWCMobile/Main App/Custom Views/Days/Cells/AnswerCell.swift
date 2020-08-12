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
        let label = UILabel(text: "Test", font: .boldSystemFont(ofSize: 18))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let view = UIView()
        addSubview(view)
        view.backgroundColor = Theme.chrisBlueLight
        view.layer.cornerRadius = 8
        view.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 2, left: 10, bottom: 2, right: 10))
        
        view.addSubview(answerLabel)
        answerLabel.centerYInSuperview()
        answerLabel.textColor = .darkText
        answerLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
