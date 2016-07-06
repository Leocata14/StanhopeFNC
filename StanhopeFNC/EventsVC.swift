//
//  EventsVC.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 7/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
//import FirebaseStorage

class EventsVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //let URL_STORAGE_BASE = FIRStorage.storage().reference(forURL: "gs://stanhopefnc-50b65.appspot.com")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        print("evnets vs")
//        let imgRef = URL_STORAGE_BASE.child("Logo_vector.jpg")
//        print("ref: \(imgRef.fullPath)")
//        //Start download
//        imgRef.data(withMaxSize: 1 * 1024 * 1024) { (data, error) in
//            if (error != nil) {
//                print("Error Mang: \(error?.debugDescription) ")
//            } else {
//                print("image boyyyy")
//                self.imageView.image = UIImage(data: data!)
//            }
//            
//        
//        }
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
