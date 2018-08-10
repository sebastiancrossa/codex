//
//  UIViewExt.swift
//  codeX
//
//  Created by Sebastian Crossa on 8/9/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit

extension UIView {

    func bindToKeyboard() {
        // Observe if the keyboard is activated (changes frame)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        
        // Contains the duration of the keyboard whe it's activated
        let keyboardViewDuration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        
        // Contains the properties of the keyboards animation
        let keyboardCurve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        
        // Retrieves the beggining position of the keyboard
        let begginingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        // Retrieves the end position of the keyboard
        let endFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        // constant that monitors change in Y axis
        let deltaY = endFrame.origin.y - begginingFrame.origin.y
    
        
        UIView.animateKeyframes(withDuration: keyboardViewDuration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: keyboardCurve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
    
}
