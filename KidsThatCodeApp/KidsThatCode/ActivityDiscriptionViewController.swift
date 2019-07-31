//
//  ActivityDiscriptionViewController.swift
//  KidsThatCode
//
//  Created by Hector Diaz on 7/23/18.
//  Copyright © 2018 KidsThatCode. All rights reserved.
//

import UIKit
import Firebase

class ActivityDiscriptionViewController: UIViewController {

    //Section 1
    //Connect the view controller elements to the code
    @IBOutlet weak var descriptionLabel4: UILabel!
    @IBOutlet weak var titleLabel4: UILabel!
    @IBOutlet weak var discriptionLabel3: UILabel!
    @IBOutlet weak var titleLabel3: UILabel!
    @IBOutlet weak var discriptionLabel2: UILabel!
    @IBOutlet weak var titleLable2: UILabel!
    @IBOutlet weak var titleLable1: UILabel!
    @IBOutlet weak var discriptionLabel1: UILabel!
    //End Section 1
    
    //Declare the reference to the database/open the connection
    var activityref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Define the path of the connection to specify the "activity" part of the database
        activityref = Database.database().reference().child("ActivityDisc")
        activityref.observe(DataEventType.value) { (snapshot) in
            
            //Section 2
            //convert database values into strings
            let snapshotValue = snapshot.value as? NSDictionary
        
            let activity1 = snapshotValue!["Activity1"] as? String
            self.titleLable1.text = activity1
            let discription1 = snapshotValue!["Discription1"] as? String
            self.discriptionLabel1.text = discription1
            
            let activity2 = snapshotValue!["Activity2"] as? String
            self.titleLable2.text = activity2
            let discription2 = snapshotValue!["Discription2"] as? String
            self.discriptionLabel2.text = discription2
            
            let activity3 = snapshotValue!["Activity3"] as? String
            self.titleLabel3.text = activity3
            let discription3 = snapshotValue!["Discription3"] as? String
            self.discriptionLabel3.text = discription3
            
            let activity4 = snapshotValue!["Activity4"] as? String
            self.titleLabel4.text = activity4
            let discription4 = snapshotValue!["Discription4"] as? String
            self.descriptionLabel4.text = discription4
            //End Section 2
        }
   
        // Do any additional setup after loading the view.
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
