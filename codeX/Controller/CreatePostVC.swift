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

        textView.delegate = self
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
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = "" // Will clear the manual placeholder text
    }
}
