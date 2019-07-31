//
//  ResetPasswordViewController.swift
//  FIRLoginPractice
//
//  Created by Jesus Medina on 9/8/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendEmailTapped(_ sender: Any) {
        let email = emailTextField;
        
        if (email?.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Error", message: "Please put an email", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            Auth.auth().sendPasswordReset(withEmail:(email?.text)!) { error in
                if (error == nil) {
                    let alertController = UIAlertController(title: "Password Reset", message: "Check your email to reset your password", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
                else {
                    let alertController = UIAlertController(title: "Error", message: "There was a problem with sending the email", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
   
    @IBAction func cancelButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func HomeButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: true, completion: nil)
    }
    
}
