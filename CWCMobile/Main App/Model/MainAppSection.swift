//
//  MainAppSection.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 7/29/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import Foundation

protocol MainCellItem {}

struct MainAppSection {
    let title: String
    fileprivate(set) var cellItems: [MainCellItem]
    
    init(title: String, cells: [MainCellItem]) {
        self.title = title
        self.cellItems = cells
    }
    
    func cellItem(at index: Int) -> MainCellItem {
        return cellItems[index]
    }
    
    func cellItemCount() -> Int {
        return cellItems.count
    }
}
