//
//  CreateGroupsVC.swift
//  codeX
//
//  Created by Sebastian Crossa on 8/10/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {

    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var emailSearchTitle: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func doneButtonWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
