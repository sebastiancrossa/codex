//
//  UserCell.swift
//  codeX
//
//  Created by Sebastian Crossa on 8/18/18.
//  Copyright © 2018 Sebastian Crossa. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing = false
    
    func configureCell(profileImage image: UIImage, withEmail email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.emailLabel.text = email
        self.checkImage.isHidden = !isSelected
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            if showing == false {
                checkImage.isHidden = false
                showing = true
            } else {
                checkImage.isHidden = true
                showing = false
            }
        }
    }

}
