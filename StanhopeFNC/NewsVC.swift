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
    static var imageCache = Cache()

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = news[(indexPath as NSIndexPath).row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell {
            var img: UIImage?
            
            if let url = article.imgUrl {
                img = NewsVC.imageCache.object(forKey: url) as? UIImage
            }
            
            cell.configureCell(article, img: img)
            return cell
        } else {
            return NewsCell()
        }
    }


}
