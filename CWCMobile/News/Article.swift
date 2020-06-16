//
//  Article.swift
//  News
//
//  Created by David Ruvinskiy on 6/17/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import Foundation

struct Article: Decodable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
}
