//
//  SignUpViewController.swift
//  MarsApp
//
//  Created by Jesus Medina on 10/18/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageName = "iosBackground";
        let image = UIImage(named: imageName);
        let imageView = UIImageView(image: image);
        
        imageView.frame = CGRect(x: 0, y: 0, width: 414, height: 896);
        view.addSubview(imageView);
        imageView.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin]
        
        //create head label for the app
        let headLabel = UILabel(frame: CGRect(x: 20, y: 100, width: 374, height: 80))
        headLabel.textColor = UIColor.white
        headLabel.font = UIFont(name: "Marker Felt", size: 35)
        headLabel.textAlignment = NSTextAlignment.center
        headLabel.text = "Sign Up!"
        self.view.addSubview(headLabel)
        headLabel.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
    
        
        //create username textfield
        usernameTextField = UITextField(frame: CGRect(x: 34, y: 400, width: 360, height: 60))
        usernameTextField.layer.cornerRadius = usernameTextField.frame.height / 2
        usernameTextField.clipsToBounds = true
        usernameTextField.backgroundColor = UIColor.lightGray
        usernameTextField.placeholder = "Username"
        usernameTextField.font = UIFont(name: "Marker Felt", size: 25)
        usernameTextField.textAlignment = NSTextAlignment.center
        usernameTextField.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        self.view.addSubview(usernameTextField)
        
        //create password textfield with secure text
        passwordTextField = UITextField(frame: CGRect(x: 34, y: 475, width: 360, height: 60))
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        passwordTextField.clipsToBounds = true
        passwordTextField.backgroundColor = UIColor.lightGray
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont(name: "Marker Felt", size: 25)
        passwordTextField.textAlignment = NSTextAlignment.center
        passwordTextField.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        self.view.addSubview(passwordTextField)
        
        retypePasswordTextField = UITextField(frame: CGRect(x: 34, y: 550, width: 360, height: 60))
        retypePasswordTextField.layer.cornerRadius = retypePasswordTextField.frame.height / 2
        retypePasswordTextField.clipsToBounds = true
        retypePasswordTextField.backgroundColor = UIColor.lightGray
        retypePasswordTextField.placeholder = " Retype Password"
        retypePasswordTextField.isSecureTextEntry = true
        retypePasswordTextField.font = UIFont(name: "Marker Felt", size: 25)
        retypePasswordTextField.textAlignment = NSTextAlignment.center
        retypePasswordTextField.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        self.view.addSubview(retypePasswordTextField)
        
        
        //create a button for the app
        let SignUpButton  = UIButton(frame: CGRect(x: 34, y: 650, width: 360, height: 60))
        SignUpButton.layer.cornerRadius = SignUpButton.frame.height / 2
        SignUpButton.clipsToBounds = true
        SignUpButton.backgroundColor = UIColor.red
        SignUpButton.setTitle("Sign-Up", for: .normal)
        SignUpButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 25)
        SignUpButton.addTarget(self, action: #selector(self.SignUpButtonTapped), for: .touchUpInside)
        SignUpButton.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        SignUpButton.showsTouchWhenHighlighted = true
        self.view.addSubview(SignUpButton)
        
        
        let loginButton = UIButton(frame: CGRect(x: 34, y: 825, width: 360, height: 30))
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.clipsToBounds = true
        loginButton.titleLabel?.textColor = .blue
        loginButton.setTitle("Already have an account? Sign in", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 20)
        loginButton.addTarget(self, action: #selector(self.SignInButtonTapped), for: .touchUpInside)
        loginButton.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        loginButton.showsTouchWhenHighlighted = true
        self.view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func SignUpButtonTapped(sender: Any) {
        if ((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || (retypePasswordTextField.text?.isEmpty)!) {
            
            let alertController = UIAlertController(title: "Error", message: "Please fill in all fields", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true)
        }
        else if (passwordTextField.text != retypePasswordTextField.text) {
            let alertController = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true)
        }
        else {
            Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
                if (error == nil) {
                    print("You have successfully signed up")
                    let alertController = UIAlertController(title: "SUCCESS", message: "You have successfully created an account, please sign-in", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true)
                    self.usernameTextField.text = nil
                    self.passwordTextField.text = nil
                    self.retypePasswordTextField.text = nil
                }
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true)
                }
            }
        }
        
    }
    @IBAction func SignInButtonTapped(sender: Any)  {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main")
        self.present(vc!, animated: true, completion: nil)
    }
    

   

}
