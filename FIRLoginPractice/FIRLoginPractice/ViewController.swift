//
//  ViewController.swift
//  FIRLoginPractice
//
//  Created by Jesus Medina on 8/30/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func LoginTapped(_ sender: Any) {
        
        let email = emailTextField; let password = passwordTextField;
        
        //check if any fields are left blank
        if ( (email?.text?.isEmpty)! || (password?.text?.isEmpty)! ) {
            
            let alertController = UIAlertController(title: "Alert", message: "All fields need to be filled.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true)
        }
        else {
            //Firebase code, Sign in user
            Auth.auth().signIn(withEmail: (email?.text)!, password: (password?.text)!) { (user, error) in
                //if there is no error signing in, go to home page view controller
                if error == nil {
                print( "You have successfully Signed in")
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                self.present(vc!, animated: true, completion: nil)
                }
                //if there is an error, display error
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

