//
//  ViewController.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 5/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            if let user = user {
                print("Logged in with the following email address:")
                print(user.email)
                self.performSegue(withIdentifier: SEGUE_LOGGED_IN, sender: nil)
            } else {
                print("No one is logged in")
            }
        })
    }
    
    
    @IBAction func loginButtonTapped(_ sender: AnyObject) {
        if let email = emailTextField.text where email != "", let pwd = passwordTextField.text where pwd != "" {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
            
                if error != nil {
                    print(error)
                    
                    if error!.code == STATUS_ACCOUNT_NONEXIST {
                        FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                            
                            if error != nil {
                                self.showAlert("Error creating account", msg: "This account already exists please try again")
                            } else {
                                UserDefaults.standard().setValue(user?.uid, forKey: KEY_UID)
                                
                                let userData = ["provider":"email"]
                                DataService.ds.createFirebaseUser(user!.uid, user: userData)
                                
                                
                                print("Logged in")
                                print(DataService.ds.REF_USER_CURRENT)
                                self.performSegue(withIdentifier: SEGUE_LOGGED_IN, sender: nil)
                            }
                            
                        })
                    } else {
                        self.showAlert("Login Failed", msg: "Please check your username and password")
                    }
                } else {
                    print("Error occurred \(error)")
                }
            
            })
        }
    }
    
    func showAlert(_ title: String, msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

