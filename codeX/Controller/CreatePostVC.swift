//
//  CreatePostVC.swift
//  codeX
//
//  Created by Sebastian Crossa on 8/8/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreatePostVC: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sendButton.bindToKeyboard() // Button will move as keyboard moves aswell
        self.hideKeyboardWhenTappedAround()
        
        textView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.emailLabel.text = Auth.auth().currentUser?.email
    }

    @IBAction func sendButtonWasPressed(_ sender: Any) {
        if textView.text != "" && textView.text != "Write something down..." {
            // Disable the send button while backend processes the message
            sendButton.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete.boolValue {
                    self.sendButton.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendButton.isEnabled = true
                    print("codeX | There was an error proccessing the message")
                }
            })
        }
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = "" // Will clear the manual placeholder text
   }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
