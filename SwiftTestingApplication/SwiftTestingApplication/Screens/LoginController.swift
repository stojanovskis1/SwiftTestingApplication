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
    @IBOutlet weak var login_btn: CustomButton!
    @IBOutlet weak var register_btn: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username_txt.delegate = self
        password_txt.delegate = self
        password_txt.isSecureTextEntry = true
        
        username_lbl.setupAsHintDescription()
        password_lbl.setupAsHintDescription()
        error_lbl.setupAsErrorMessage()
        
        username_lbl.text = NSLocalizedString("username", comment: "")
        password_lbl.text = NSLocalizedString("password", comment: "")
        login_btn.setTitle(NSLocalizedString("login", comment:"").uppercased(), for: .normal)
        register_btn.setTitle(NSLocalizedString("register", comment:"").uppercased(), for: .normal)
        
        login_btn.purpleRoundedCornersWithShaddow()
        register_btn.orangeRoundedCornersWithShaddow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    

    @IBAction func onClickLogin(_ sender: Any) {
        if let username = username_txt.text,
            let password = password_txt.text {
            
            if (!username.isValidEmail()){
                error_lbl.text = NSLocalizedString("email_error", comment: "")
            } else if (!password.isValidPassword()){
                 error_lbl.text = NSLocalizedString("password_error", comment: "")
            } else {
                error_lbl.text = "";
                let homeView = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                self.navigationController?.pushViewController(homeView, animated: true)
                
                //TODO login user
            }
        }
    }
    
    @IBAction func onClickRegister(_ sender: Any) {
       let homeView = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(homeView, animated: true)
        
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
