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
    
    init(day: Day) {
        self.sections = DayDetails.loadSections(with: day)
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9489166141, green: 0.9490789771, blue: 0.9489063621, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        
        collectionView.register(DayVideoCell.self, forCellWithReuseIdentifier: DayVideoCell.videoCellId)
        collectionView.register(AnswerCell.self, forCellWithReuseIdentifier: AnswerCell.answerCellId)
        collectionView.register(DayHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DayHeaderView.reuseId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].itemsCount()
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
        
        if let item = item as? String {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnswerCell.answerCellId, for: indexPath) as? AnswerCell else { return UICollectionViewCell() }
            cell.label.text = item
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
        coordinator?.didSelectVideo()
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
        
        let items = sections[indexPath.section].cells
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DayHeaderView.reuseId, for: indexPath) as? DayHeaderView else { return UICollectionReusableView() }
        headerView.title.text = sections[indexPath.section].title
        
        if items.isEmpty {
            headerView.backgroundColor = Theme.chrisBlue
            headerView.title.textColor = .white
            return headerView
        }
        
        headerView.backgroundColor = (indexPath.section % 2 == 0) ? Theme.rowLight : Theme.rowDark
        headerView.title.textColor = .darkText
        
        return headerView
    }
}
