//
//  AppsDataSource.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/27/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class AppsDataSource: NSObject, UICollectionViewDataSource {
    var items = App.loadApps()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
    
    func app(at index: Int) -> App {
        return items[index]
    }
}
