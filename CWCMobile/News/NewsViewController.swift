//
//  ViewController.swift
//  News
//
//  Created by David Ruvinskiy on 6/17/18.
//  Copyright © 2018 David Ruvinskiy. All rights reserved.
//

import UIKit

// swiftlint:disable all

class NewsViewController: SwipingAppController, Floatable {
    
    var model = ArticleModel()
    var articles = [Article]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Conform to the tableview protocols
        tableView.delegate = self
        tableView.dataSource = self
        
        //Get the articles from the article model
        model.delegate = self
        model.getArticles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isMovingToParent { sendFloatingViewUp() }
    }
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Return the number of articles
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        //Get article that the tableview is trying to display
        let article = articles[indexPath.row]
        
        cell.displayArticle(article)
        
        //Return that cell
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController.instantiate()
        let article = articles[indexPath.row]
        detailVC.articleUrl = article.url
        detailVC.coordinator = coordinator
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension NewsViewController: ArticleModelProtocol {
    
    func articlesRetrieved(_ articles: [Article]) {
        
        self.articles = articles
        tableView.reloadData()
    }
}
