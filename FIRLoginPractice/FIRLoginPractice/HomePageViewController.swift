//
//  HomePageViewController.swift
//  FIRLoginPractice
//
//  Created by Jesus Medina on 8/31/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomePageViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetPasswordTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Reset Password")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func LogoutTapped(_ sender: Any) {
        
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main")
                self.present(vc!, animated: true, completion: nil)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
