//
//  ViewController.swift
//  MarsApp
//
//  Created by Jesus Medina on 10/18/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

   
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //settting the background of the app
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
        headLabel.text = "Sign-In"
        self.view.addSubview(headLabel)
        headLabel.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        
        
        //create username textfield
        usernameTextField = UITextField(frame: CGRect(x: 34, y: 400, width: 360, height: 60))
        usernameTextField.layer.cornerRadius = usernameTextField.frame.height / 2
        usernameTextField.clipsToBounds = true
        usernameTextField.backgroundColor = UIColor.lightGray
        usernameTextField.placeholder = "Email"
        usernameTextField.font = UIFont(name: "Marker Felt", size: 25)
        usernameTextField.textAlignment = NSTextAlignment.center
        usernameTextField.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        usernameTextField.delegate = self as? UITextFieldDelegate
        self.view.addSubview(usernameTextField)
        
        
        //create password textfield with secure text
        passwordTextField = UITextField(frame: CGRect(x: 34, y: 475, width: 360, height: 60))
        passwordTextField.layer.cornerRadius = usernameTextField.frame.height / 2
        passwordTextField.clipsToBounds = true
        passwordTextField.backgroundColor = UIColor.lightGray
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont(name: "Marker Felt", size: 25)
        passwordTextField.textAlignment = NSTextAlignment.center
        passwordTextField.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        passwordTextField.delegate = self as? UITextFieldDelegate
        self.view.addSubview(passwordTextField)
        
        
        //create a button for the app
        let Signinbutton  = UIButton(frame: CGRect(x: 34, y: 570, width: 360, height: 60))
        Signinbutton.layer.cornerRadius = Signinbutton.frame.height / 2
        Signinbutton.clipsToBounds = true
        Signinbutton.backgroundColor = UIColor.red
        Signinbutton.setTitle("login", for: .normal)
        Signinbutton.titleLabel?.font = UIFont(name: "Marker Felt", size: 25)
        Signinbutton.addTarget(self, action: #selector(self.LoginbuttonTapped), for: .touchUpInside)
        Signinbutton.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        Signinbutton.showsTouchWhenHighlighted = true
        self.view.addSubview(Signinbutton)
        
        
        //create a button called sign up to allow user to create an account
        let signUpButton = UIButton(frame: CGRect(x: 34, y: 825, width: 360, height: 30))
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        signUpButton.clipsToBounds = true
        signUpButton.titleLabel?.textColor = .blue
        signUpButton.setTitle("Don't have an account? Sign up!", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 20)
        signUpButton.addTarget(self, action: #selector(self.SignUpButtonTapped), for: .touchUpInside)
        signUpButton.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        signUpButton.showsTouchWhenHighlighted = true
        self.view.addSubview(signUpButton)
        
        
    
        
    }
    
    @IBAction func LoginbuttonTapped(sender: Any) {

        if ( (usernameTextField.text?.isEmpty)! || ((passwordTextField.text?.isEmpty)!) ) {
            let alertController = UIAlertController(title: "Error", message: "Please fill in all fields!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true)
        }
        else {
            Auth.auth().signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed in")
            
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                }
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true)
                }
            }
        }
    }
    
    @IBAction func SignUpButtonTapped(sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUp")
        self.present(vc!, animated: true, completion: nil)
    }
    


}

