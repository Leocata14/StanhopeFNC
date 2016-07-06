//
//  NewsDetailVC.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 6/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import UIKit
import Alamofire

class NewsDetailVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var newsUrl = ""

    override func viewDidLoad() {
        super.viewDidLoad()
print(newsUrl)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let url = NSURL(string: newsUrl)
        let requestObj = NSURLRequest(url: url as! URL)
        webView.loadRequest(requestObj as URLRequest)
        
    }
    

}
