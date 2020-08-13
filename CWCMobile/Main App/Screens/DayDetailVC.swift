//
//  DayDetailVC.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/10/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class DayDetailVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    weak var coordinator: DayDetailCoordinator?
    fileprivate let sections: [DayDetailSection]
    
    let day: Day
    
    init(day: Day) {
        self.day = day
        self.sections = DayDetails.loadSections(with: day)
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        title = "Day \(day.number)"
        
        collectionView.register(DayVideoCell.self, forCellWithReuseIdentifier: DayVideoCell.videoCellId)
        collectionView.register(AnswerCell.self, forCellWithReuseIdentifier: AnswerCell.answerCellId)
        collectionView.register(DayDetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DayDetailHeaderView.reuseId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].itemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let items = sections[section].cells
        
        if items.isEmpty {
            return .zero
        }
        
        if items is [Answer] {
            return .init(top: 10, left: 0, bottom: 10, right: 0)
        }
        
        return .zero
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = sections[indexPath.section].dayDetailCellItem(at: indexPath.item)
        
        if let item = item as? VideoItem {
            switch item {
            case .video(let day):
                
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayVideoCell.videoCellId, for: indexPath) as? DayVideoCell else { return UICollectionViewCell() }
                cell.day = day
                return cell
                
            }
        }
        
        if let item = item as? Answer {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswerCell.answerCellId, for: indexPath) as? AnswerCell else { return UICollectionViewCell() }
            
            cell.answerLabel.text = item.text
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = sections[indexPath.section].dayDetailCellItem(at: indexPath.item)
        
        if item is VideoItem {
            return .init(width: view.frame.width, height: view.frame.width / 16 * 9)
        }
        
        return .init(width: view.frame.width, height: 60)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let items = sections[indexPath.section].cells
        if items is [VideoItem] { coordinator?.didSelectVideo() }
        
        guard let answers = sections[indexPath.section].cells as? [Answer] else { return }
        coordinator?.didSelectAnswer(answer: answers[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let items = sections[section].cells
        
        let width: CGFloat = view.frame.width
        
        if items.isEmpty {
            return .init(width: width, height: 40)
        }
        
        if items is [VideoItem] {
            return .zero
        }
        
        return .init(width: width, height: 60)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DayDetailHeaderView.reuseId, for: indexPath) as? DayDetailHeaderView else { return UICollectionReusableView() }
        let section = sections[indexPath.section]
        
        section.number = indexPath.section
        headerView.section = sections[indexPath.section]
        
        return headerView
    }
}
