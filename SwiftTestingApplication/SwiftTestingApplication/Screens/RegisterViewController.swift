//
//  RegisterViewController.swift
//  SwiftTestingApplication
//
//  Created by Stefan Stojanovski on 23/12/2020.
//  Copyright © 2020 Stefan Stojanovski. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var first_name_lbl: UILabel!
    @IBOutlet weak var last_name_lbl: UILabel!
    @IBOutlet weak var email_lbl: UILabel!
    @IBOutlet weak var password_lbl: UILabel!
    @IBOutlet weak var email_error_lbl: UILabel!
    @IBOutlet weak var password_error_lbl: UILabel!
    @IBOutlet weak var first_name_txt: UITextField!
    @IBOutlet weak var last_name_txt: UITextField!
    @IBOutlet weak var email_txt: UITextField!
    @IBOutlet weak var password_txt: UITextField!
    @IBOutlet weak var register_btn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        first_name_txt.delegate = self
        last_name_txt.delegate = self
        email_txt.delegate = self
        password_txt.delegate = self
        password_txt.isSecureTextEntry = true
        
        first_name_lbl.setupAsHintDescription()
        last_name_lbl.setupAsHintDescription()
        email_lbl.setupAsHintDescription()
        password_lbl.setupAsHintDescription()
        
        email_error_lbl.setupAsErrorMessage()
        password_error_lbl.setupAsErrorMessage()
        
        email_error_lbl.isHidden = true
        password_error_lbl.isHidden = true
        
        first_name_lbl.text = NSLocalizedString("first_name", comment: "")
        last_name_lbl.text = NSLocalizedString("last_name", comment: "")
        password_lbl.text = NSLocalizedString("password", comment: "")
        email_lbl.text = NSLocalizedString("email", comment: "")
        
        email_error_lbl.text = NSLocalizedString("email_error", comment: "")
        password_error_lbl.text = NSLocalizedString("password_error", comment: "")
        
        register_btn.setTitle(NSLocalizedString("register", comment:"").uppercased(), for: .normal)
        register_btn.orangeRoundedCornersWithShaddow()
    }
    

    @IBAction func onClickRegister(_ sender: Any) {
        if let email = email_txt.text,
            let password = password_txt.text {
                if (!email.isValidEmail()){
                    email_error_lbl.isHidden = false
                    email_error_lbl.text = NSLocalizedString("email_error", comment: "")
                } else if (!password.isValidPassword()){
                     email_error_lbl.isHidden = true
                     password_error_lbl.isHidden = false
                     password_error_lbl.text = NSLocalizedString("password_error", comment: "")
                } else {
                    email_error_lbl.text = "email_error";
                    email_error_lbl.isHidden = true
                    password_error_lbl.isHidden = true
                    //TODO login user
                    let homeView = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                    self.navigationController?.pushViewController(homeView, animated: true)                }
                
        }
    }
}
