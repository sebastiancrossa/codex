//
//  Message.swift
//  codeX
//
//  Created by Sebastian Crossa on 8/9/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String
    private var _senderID: String
    
    var content: String {
        return _content
    }
    
    var senderID: String {
        return _senderID
    }
    
    init(content: String, senderID: String) {
        self._content = content
        self._senderID = senderID
    }
    
}
