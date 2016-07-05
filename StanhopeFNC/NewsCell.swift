//
//  NewsCell.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 6/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import UIKit
import Alamofire

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    var news: News!
    var request: Request?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(news: News, img: UIImage?) {
        self.news = news
        self.title.text = news.title
        self.publishedDateLabel.text = news.pubDate
        
        if news.imgUrl != nil {
            if img != nil {
                self.newsImg.image = img
            } else {
                request = Alamofire.request(.GET, news.imgUrl!).validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, error) in
                    
                    if error == nil {
                        let img = UIImage(data: data!)!
                        self.newsImg.image = img
                        NewsVC.imageCache.setObject(img, forKey: self.news.imgUrl!)
                    }
                    
                })
            }
        }
    }

}
