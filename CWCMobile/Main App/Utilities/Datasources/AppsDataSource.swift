//
//  AppsDataSource.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/27/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

// swiftlint:disable all

class AppsDataSource: NSObject, UICollectionViewDataSource {
    var items = App.loadApps()
    let videos = (Bundle.main.decode("videos.json") as VideoData).videos
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerId", for: indexPath) as? VideoGroupCell else { return UICollectionViewCell() }
            cell.horizontalController.videos = videos
            cell.horizontalController.collectionView.reloadData()
            return cell
        }
        
        let cellType = items[indexPath.item].cellType.rawValue
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType, for: indexPath) as? BaseAppCell else { return UICollectionViewCell() }
        
        if let imageAppCell = cell as? ImageAppCell, let imageApp = items[indexPath.item] as? ImageApp {
            imageAppCell.imageApp = imageApp
        }
        
        if let colorAppCell = cell as? ColorAppCell, let colorApp = items[indexPath.item] as? ColorApp {
            colorAppCell.colorApp = colorApp
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func app(at index: Int) -> App {
        return items[index]
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "foo", for: indexPath) as? HeaderView else { return UICollectionReusableView() }
        header.title.text = "Foo"
        return header
    }
}
