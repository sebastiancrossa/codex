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
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: DarwinBoolean) -> ()) {
        // Check to see if the user is wanting to post on the group board or on the feed
        if groupKey != nil {
            
        } else {
            // Will generate a differente UID for each message posted
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderId": uid])
            
            sendComplete(true)
        }
    }
    
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                
                let message = Message(content: content, senderID: senderId) // properly created a message
                
                messageArray.append(message)
            }
            
            handler(messageArray)
            
        }
    }
    
}
