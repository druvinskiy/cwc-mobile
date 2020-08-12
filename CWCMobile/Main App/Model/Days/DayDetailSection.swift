//
//  DayDetailSection.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 8/11/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

protocol DayDetailCellItem {}

class DayDetailSection {
    let title: String
    fileprivate(set) var cells: [DayDetailCellItem]
    
    init(title: String, cells: [DayDetailCellItem]) {
        self.title = title
        self.cells = cells
    }
    
    func dayDetailCellItem(at index: Int) -> DayDetailCellItem {
        return cells[index]
    }
    
    func itemsCount() -> Int {
        return cells.count
    }
}

enum VideoItem: DayDetailCellItem {
    case video(Day)
}
