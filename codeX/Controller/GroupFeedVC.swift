//
//  GroupFeedVC.swift
//  codeX
//
//  Created by Sebastian Crossa on 8/19/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLabel: NSLayoutConstraint!
    @IBOutlet weak var membersLabel: UILabel!
    
    @IBOutlet weak var sendButtonView: UIView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendButtonView.bindToKeyboard()
    }
    
    
    @IBOutlet weak var sendButtonWasPressed: UIButton!
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
