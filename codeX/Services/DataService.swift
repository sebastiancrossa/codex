//
//  DataService.swift
//  codeX
//
//  Created by Sebastian Crossa on 5/27/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import Foundation
import Firebase

// Base URL of our database
let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    // Private variables only accesible to this file
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users") // appending a child to our database reference
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    // --
    
    // Public variables
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    // --
    
    // Pushing data to Firebase
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
