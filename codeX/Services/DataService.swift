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
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    
    
}
