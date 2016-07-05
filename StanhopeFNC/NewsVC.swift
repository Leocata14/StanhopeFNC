//
//  NewsVC.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 5/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import UIKit
import Firebase

class NewsVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var news = [News]()
    static var imageCache = NSCache()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 225
        self.title = "News"
        
//        DataService.ds.REF_NEWS.observeEventType(FIRDataEventType.Value) { (snapshot) in
//            
//            
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let article = news[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell") as? NewsCell {
            var img: UIImage?
            
            if let url = article.imgUrl {
                img = NewsVC.imageCache.objectForKey(url) as? UIImage
            }
            
            cell.configureCell(article, img: img)
            return cell
        } else {
            return NewsCell()
        }
    }


}
