//
//  AppsDataSource.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/27/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AppsDataSource: NSObject, UICollectionViewDataSource {
    fileprivate let sections = MainApp.loadSections()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let cellItems = sections[section].cellItems
        if cellItems is [Video] { return 1 }
        
        return sections[section].cellItemCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellItems = sections[indexPath.section].cellItems
        
        if let cellItems = cellItems as? [Video],
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoGroupCell.cellId, for: indexPath) as? VideoGroupCell {
            cell.horizontalController.videos = cellItems
            cell.horizontalController.collectionView.reloadData()
            return cell
        }
        
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
