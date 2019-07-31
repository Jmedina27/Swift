//
//  RegisterViewController.swift
//  FirebaseLoginRegister
//
//  Created by Jesus Medina on 8/29/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var RetypePassTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func RegisterTapped(_ sender: Any) {
        let email = emailTextField; let pass = PasswordTextField; let retypePass = RetypePassTextField;
        
        if ((email?.text?.isEmpty)! || (pass?.text?.isEmpty)! || (retypePass?.text?.isEmpty)! ) {
            
            let alertController = UIAlertController(title: "Alert", message: "Please fill in all fields", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true)
        }
        
        //if ( pass != retypePass) {
           // let alertController = UIAlertController(title: "Alert", message: "Passwords do not match!", preferredStyle: .alert)
            //alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
           // self.present(alertController, animated: true)
       // }
        
        else {
            Auth.auth().createUser(withEmail: (email?.text!)!, password: (pass?.text!)!) { (authResult, error) in
                // ...
                guard (authResult?.user) != nil else { return }
            }

                /*if error == nil{
                    self.performSegue(withIdentifier: "loginTestViewController", sender: self)
                }
                else {
                let alertController = UIAlertController(title: "Error", message: "Unable to create account!", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true)
                }*/
            }
        }

}
