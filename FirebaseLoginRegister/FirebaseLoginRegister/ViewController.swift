//
//  ViewController.swift
//  FirebaseLoginRegister
//
//  Created by Jesus Medina on 8/29/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let email = emailTextField; let password = passwordTextField;
        
        Auth.auth().signIn(withEmail: (email?.text)!, password: (password?.text)!) { (user, Error) in }
            
        }
}

