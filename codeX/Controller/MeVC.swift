//
//  MeVC.swift
//  codeX
//
//  Created by Sebastian Crossa on 8/8/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signOutButtonWasPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want yo log out?", preferredStyle: .actionSheet)
        
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
