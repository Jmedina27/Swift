//
//  CampViewController.swift
//  KidsThatCode
//
//  Created by Hector Diaz on 6/29/18.
//  Copyright © 2018 KidsThatCode. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CampViewController: UIViewController {
    //Declares the variable for the users name
    var studentUser = ""
    
    var ref : DatabaseReference!
    var refHandle : UInt!
    
    /****************** Declares the Buttons and labels****************************/
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func SubmitButtonPressed(_ sender: Any) {
        if userNameTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            
            self.present(alertController, animated: true)
        }
        else {
            studentUser = userNameTextField.text as! String
            checkUserName()
        }
    
    }
    
    /******************************************************************************/
    //Declare the connection to the datbase
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        refHandle = ref.observe(DataEventType.value, with: { (snapshot) in
            let dataDict = snapshot.value as! [String : AnyObject]
            
            print(dataDict)
        })
        
    }
    
    func checkUserName(){
        ref.child("Scratch").child(studentUser).observeSingleEvent(of: .value) { (snapshot) in
            let snapshotValue = snapshot.value as? NSDictionary
            let email = snapshotValue!["Email"] as? String
            let password = snapshotValue!["Password"] as? String
            self.usernameLabel.text = email
            self.passwordLabel.text = password
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
