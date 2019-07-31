//
//  HomeViewController.swift
//  FIRLoginPractice
//
//  Created by Jesus Medina on 8/30/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogoutTapped(_ sender: Any) {
        //if the current user is still logged on, sign out user when logout is tapped
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                //when logout is tapped, return to login screen
                let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Register")
                present(vc, animated: true, completion: nil)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func HomeTapped(_ sender: Any) {
        //when Home button is tapped,, go to home page screen
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: true, completion: nil)
    }
    
}
