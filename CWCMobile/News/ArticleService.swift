//
//  ArticleService.swift
//  News
//
//  Created by David Ruvinskiy on 6/17/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import Foundation

struct ArticleService: Decodable {
    
    var totalResults: Int?
    var articles: [Article]?
}
