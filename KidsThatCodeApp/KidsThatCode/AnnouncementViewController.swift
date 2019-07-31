//
//  AnnouncementViewController.swift
//  KidsThatCode
//
//  Created by Hector Diaz on 7/24/18.
//  Copyright © 2018 KidsThatCode. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AnnouncementViewController: UIViewController {

    @IBOutlet weak var announcement3Label: UILabel!
    @IBOutlet weak var announcement2Label: UILabel!
    @IBOutlet weak var announcement1Label: UILabel!
    
    var announcementref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        announcementref = Database.database().reference().child("Announcements")
        announcementref.observe(DataEventType.value) { (snapshot) in
            let snapshotValue = snapshot.value as? NSDictionary
            
            //Name of Variable  Convert to english  Look for this name in the databse Save as string
            let announcement1 = snapshotValue!["Announcement1"] as? String
            self.announcement1Label.text = announcement1
            
            let announcement2 = snapshotValue!["Announcement2"] as? String
            self.announcement2Label.text = announcement2
            
            let announcement3 = snapshotValue!["Announcement3"] as? String
            self.announcement3Label.text = announcement3
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
