//
//  RegisterViewController.swift
//  FIRLoginPractice
//
//  Created by Jesus Medina on 8/30/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegisterTapped(_ sender: Any) {
        
        let email = emailTextField; let password = PasswordTextField;
        
        if ( (email?.text?.isEmpty)! || (password?.text?.isEmpty)! ) {
            
            let alertController = UIAlertController(title: "Alert", message: "All fields need to be filled out!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController,animated: true)
        }
        else {
            Auth.auth().createUser(withEmail: (email?.text)!, password: (password?.text)!) { (user, error) in
                
                if error == nil {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Success")
                self.present(vc!, animated: true, completion: nil)
                }
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
                
    }
    
}
