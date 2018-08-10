//
//  AuthVC.swift
//  codeX
//
//  Created by Sebastian Crossa on 5/28/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // If there's a user, dismiss login view
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func signInWithEmailButtonWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSignInButtonWasPressed(_ sender: Any) {
    }
    
    @IBAction func facebookSignInButtonWasPressed(_ sender: Any) {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
