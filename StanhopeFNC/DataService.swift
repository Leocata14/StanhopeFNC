//
//  DataService.swift
//  StanhopeFNC
//
//  Created by Jason Leocata on 5/07/2016.
//  Copyright © 2016 Jason Leocata. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = URL_BASE
    private var _REF_USERS = URL_BASE.child("users")
    private var _REF_NEWS = URL_BASE.child("news")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_NEWS: FIRDatabaseReference {
        return _REF_NEWS
    }
    
    
    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        let user = URL_BASE.child("users").child(uid)
        return user
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>){
        REF_USERS.child(uid).setValue(user)
    }
}
