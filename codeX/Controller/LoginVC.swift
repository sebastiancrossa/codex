//
//  LoginVC.swift
//  codeX
//
//  Created by Sebastian Crossa on 5/28/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func signInButtonWasPressed(_ sender: Any) {
        
        if emailField.text != nil && passwordField.text != nil {
            
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, loginError) in
                
                // If the user is already registered
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("codeX ERROR | \(String(describing: loginError?.localizedDescription))")
                }
                
                // If the user hasnt registered yet
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    
                    print(self.emailField.text)
                    
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            print("codeX | Succesfully registered user")
                        })
                    } else {
                        print("codeX ERROR | \(String(describing: registrationError?.localizedDescription))")
                    }
                    
                })
                
            } // We know that we have email && pasword values, so we unwrap it
            
        }
        
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil) // Get rid of the View Controller
    }
}

extension LoginVC: UITextFieldDelegate { }
