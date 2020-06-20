//
//  UITableView+Ext.swift
//  CWCMobile
//
//  Created by David Ruvinskiy on 6/20/20.
//  Copyright © 2020 David Ruvinskiy. All rights reserved.
//

import UIKit

extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
