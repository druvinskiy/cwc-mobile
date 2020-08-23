//
//  DaysDataSource.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 5/27/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

class DaysDataSource: NSObject, UICollectionViewDataSource {
    var days: [Day]
    
    init(days: [Day]) {
        self.days = days
    }
    
    var videoDidSelectHandler: ((Video) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.dayCellId, for: indexPath) as? DayCell else { return UICollectionViewCell() }
        let day = days[indexPath.row]
        
        day.number = indexPath.row + 1
        cell.day = day
        
        return cell
    }
}
