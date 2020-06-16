//
//  ArticleModel.swift
//  News
//
//  Created by David Ruvinskiy on 6/17/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol: AnyObject {
    
    func articlesRetrieved(_ articles: [Article])
}

class ArticleModel {
    
    weak var delegate: ArticleModelProtocol?
    
    func getArticles() {
        let path = Bundle.main.path(forResource: "top-headlines", ofType: ".json")
        
        guard path != nil else {
            print("Can't find the json file")
            return
        }
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode(ArticleService.self, from: data)
            let articles = result.articles!
            
            delegate?.articlesRetrieved(articles)
        } catch {
            print("Couldn't create Data object from file")
        }
    } //End getArticles
    
} //End ArticleModel
