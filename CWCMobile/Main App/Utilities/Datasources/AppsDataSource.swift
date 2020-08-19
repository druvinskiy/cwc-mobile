//
//  AppsDataSource.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/19/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AppsDataSource: NSObject, UICollectionViewDataSource {
    fileprivate let sections = MainApp.loadSections()
    
    var videoDidSelectHandler: ((Video) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sections[section].cellItemCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellItem = sections[indexPath.section].cellItem(at: indexPath.row)
        
        if let cellItem = cellItem as? AppItem {
            switch cellItem {
            case .match(let imageApp),
                 .quiz(let imageApp),
                 .war(let imageApp):
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageAppCell.imageCellId, for: indexPath) as? ImageAppCell
                cell?.imageApp = imageApp
                return cell ?? UICollectionViewCell()
                
            case .guidebook(let colorApp),
                 .news(let colorApp),
                 .photo(let colorApp):
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorAppCell.colorCellId, for: indexPath) as? ColorAppCell
                cell?.colorApp = colorApp
                return cell ?? UICollectionViewCell()
                
            }
        }
        
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
        
        let section = sections[indexPath.section]
        header.title.text = section.title
        
        return header
    }
}
