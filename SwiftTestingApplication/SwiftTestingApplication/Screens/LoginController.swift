//
//  LoginController.swift
//  SwiftTestingApplication
//
//  Created by Stefan Stojanovski on 26/11/2020.
//  Copyright © 2020 Stefan Stojanovski. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var username_lbl: UILabel!
    @IBOutlet weak var username_txt: UITextField!
    @IBOutlet weak var password_lbl: UILabel!
    @IBOutlet weak var password_txt: UITextField!
    @IBOutlet weak var error_lbl: UILabel!
    @IBOutlet weak var login_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username_txt.delegate = self
        password_txt.delegate = self
        
        username_lbl.setupAsHintDescription()
        password_lbl.setupAsHintDescription()
        error_lbl.setupAsErrorMessage()
        
        username_lbl.text = NSLocalizedString("username", comment: "")
        password_lbl.text = NSLocalizedString("password", comment: "")
        login_btn.setTitle(NSLocalizedString("login", comment:"").uppercased(), for: .normal)
        
        login_btn.orangeRoundedCornersWithShaddow()
    }
    

    @IBAction func onClickLogin(_ sender: Any) {
        if let username = username_txt.text , let password = password_txt.text {
            
            if (!username.isValidEmail()){
                error_lbl.text = NSLocalizedString("email_error", comment: "")
            } else if (!password.isValidPassword()){
                 error_lbl.text = NSLocalizedString("password_error", comment: "")
            } else {
                error_lbl.text = "";
                //TODO login user
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case self.username_txt:
            password_txt.becomeFirstResponder()
            break
        case self.password_txt:
            password_txt.resignFirstResponder()
            break
        default:
            username_txt.becomeFirstResponder()
        }
        return true
    }
}
