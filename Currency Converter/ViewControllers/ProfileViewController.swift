//
//  ProfileViewController.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    
    let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.image = UIImage(named: user.image)
        fullNameLabel.text = user.fullname
        emailLabel.text = user.email
        phoneNumberLabel.text = user.phoneNumber
    }
}
