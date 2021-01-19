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
    @IBOutlet weak var pass_txt: UITextField!
    @IBOutlet weak var error_lbl: UILabel!
    @IBOutlet weak var login_btn: CustomButton!
    @IBOutlet weak var register_btn: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForTesting()
        username_txt.delegate = self
        pass_txt.delegate = self
        pass_txt.isSecureTextEntry = true
        
        username_lbl.setupAsHintDescription()
        password_lbl.setupAsHintDescription()
        error_lbl.setupAsErrorMessage()
        
        username_lbl.text = NSLocalizedString("username", comment: "")
        pass_txt.text = NSLocalizedString("password", comment: "")
        login_btn.setTitle(NSLocalizedString("login", comment:"").uppercased(), for: .normal)
        register_btn.setTitle(NSLocalizedString("register", comment:"").uppercased(), for: .normal)
        
        login_btn.purpleRoundedCornersWithShaddow()
        register_btn.orangeRoundedCornersWithShaddow()
        
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "isUserLoggedIn") {
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            self.navigationController?.pushViewController(homeView, animated: true)
            view.endEditing(true)
        }
    }
    
    func setupForTesting(){
        
        pass_txt.isAccessibilityElement = true
        username_txt.isAccessibilityElement = true
        error_lbl.isAccessibilityElement = true
        
        pass_txt.accessibilityIdentifier = "password_txt_login"
        username_txt.accessibilityIdentifier = "username_txt_login"
        error_lbl.accessibilityIdentifier = "login_error_lbl"
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
            let password = pass_txt.text {

            if (!username.isValidEmail()){
                error_lbl.text = NSLocalizedString("email_error", comment: "")
            } else if (!password.isValidPassword()){
                 error_lbl.text = NSLocalizedString("password_error", comment: "")
            } else {
                error_lbl.text = ""
                let homeView = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                self.navigationController?.pushViewController(homeView, animated: true)
            
            let defaults = UserDefaults.standard
                defaults.setValue(true, forKey: "isUserLoggedIn")
                defaults.setValue(username, forKey: "username")
                
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
            pass_txt.becomeFirstResponder()
            break
        case self.pass_txt:
            pass_txt.resignFirstResponder()
            break
        default:
            username_txt.becomeFirstResponder()
        }
        return true
    }
}
