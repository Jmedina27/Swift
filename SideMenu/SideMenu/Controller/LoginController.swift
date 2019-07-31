//
//  LoginController.swift
//  SideMenu
//
//  Created by Jesus Medina on 5/11/19.
//  Copyright © 2019 Jesus Medina. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        ConfigureUsernameTextfield()
        ConfigurePasswordTextField()
        ConfigureSignInButton()
        
    }
    
    
    func ConfigureUsernameTextfield () {
        usernameTextField = UITextField(frame: CGRect(x: 28, y: 400, width: 360, height: 60))
        usernameTextField.layer.cornerRadius = usernameTextField.frame.height / 2
        usernameTextField.clipsToBounds = true
        usernameTextField.backgroundColor = .darkGray
        usernameTextField.placeholder = "Email"
        usernameTextField.font = UIFont(name: "Marker Felt", size: 25)
        usernameTextField.textAlignment = NSTextAlignment.center
        usernameTextField.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        usernameTextField.delegate = self as? UITextFieldDelegate
        self.view.addSubview(usernameTextField)
    }
    
    func ConfigurePasswordTextField () {
        passwordTextField = UITextField(frame: CGRect(x: 28, y: 475, width: 360, height: 60))
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        passwordTextField.clipsToBounds = true
        passwordTextField.backgroundColor = .darkGray
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont(name: "Marker Felt", size: 25)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textAlignment = NSTextAlignment.center
        passwordTextField.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        passwordTextField.delegate = self as? UITextFieldDelegate
        self.view.addSubview(passwordTextField)
    }
    
    func ConfigureSignInButton () {
        let SignInButton = UIButton(frame: CGRect(x: 28, y: 570, width: 360, height: 60))
        SignInButton.layer.cornerRadius = SignInButton.frame.height/2
        SignInButton.clipsToBounds = true
        SignInButton.backgroundColor = .red
        SignInButton.setTitle("Login", for: .normal)
        SignInButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 25)
        SignInButton.addTarget(self, action: #selector((SignInButtonTapped)), for: .touchUpInside)
        SignInButton.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        SignInButton.showsTouchWhenHighlighted = true
        self.view.addSubview(SignInButton)
    }
    
    @IBAction func SignInButtonTapped(sender: Any) {
        if ((usernameTextField.text!.isEmpty) || (passwordTextField.text!.isEmpty) ) {
            print("Not all field were entered")
            let alertController = UIAlertController(title: "Error", message: "Please in fill in all the fields!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alertController, animated: true)
        }
        else {
            let navController = UINavigationController(rootViewController: HomeController())
            self.present(navController, animated: true, completion: nil)
            
        }
    }

}
