//
//  CampInfoViewController.swift
//  KidsThatCode
//
//  Created by Hector Diaz on 7/8/18.
//  Copyright © 2018 KidsThatCode. All rights reserved.
//

import UIKit
import Firebase

class CampInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var scheduleTable: UITableView!
    
    var scheduleRef: DatabaseReference!
    var scheduleArray: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let scheduleCell = scheduleArray[indexPath.row]
        //print(scheduleCell)
        cell.textLabel?.text = scheduleCell
        if (indexPath.row % 2 == 0) { cell.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 255/255, alpha: 1.0)
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleRef = Database.database().reference().child("Schedule").child("Camp")
        scheduleRef.observe(DataEventType.value) { (snapshot) in
            
            //Convert Data in database to string
            let snapshotValue = snapshot.value as? NSDictionary
            
            //Store the Day of the week and append it
            let day = snapshotValue!["Day"] as? String
            self.scheduleArray.append(day!)
            
            //First activity with time
            let Time1 = snapshotValue!["Time1"] as? String
            self.scheduleArray.append(Time1!)
            let activity1 = snapshotValue!["Activity1"] as? String
            self.scheduleArray.append(activity1!)
            
            //2nd activity & time
            let Time2 = snapshotValue!["Time2"] as? String
            self.scheduleArray.append(Time2!)
            let activity2 = snapshotValue!["Activity2"] as? String
            self.scheduleArray.append(activity2!)
            
            //3rd act & time
            let Time3 = snapshotValue!["Time3"] as? String
            self.scheduleArray.append(Time3!)
            let activity3 = snapshotValue!["Activity3"] as? String
            self.scheduleArray.append(activity3!)
            
            //4th act & time
            let Time4 = snapshotValue!["Time4"] as? String
            self.scheduleArray.append(Time4!)
            let activity4 = snapshotValue!["Activity4"] as? String
            self.scheduleArray.append(activity4!)
            
            //5th act & time
            let Time5 = snapshotValue!["Time5"] as? String
            self.scheduleArray.append(Time5!)
            let activity5 = snapshotValue!["Activity5"] as? String
            self.scheduleArray.append(activity5!)
            
            //6th act & time
            let Time6 = snapshotValue!["Time6"] as? String
            self.scheduleArray.append(Time6!)
            let activity6 = snapshotValue!["Activity6"] as? String
            self.scheduleArray.append(activity6!)
            
            //7th act & time
            let Time7 = snapshotValue!["Time7"] as? String
            self.scheduleArray.append(Time7!)
            let activity7 = snapshotValue!["Activity7"] as? String
            self.scheduleArray.append(activity7!)
            
            //8th act & time
            let Time8 = snapshotValue!["Time8"] as? String
            self.scheduleArray.append(Time8!)
            let activity8 = snapshotValue!["Activity8"] as? String
            self.scheduleArray.append(activity8!)
            self.scheduleTable.reloadData()
        }
        self.scheduleTable.reloadData()
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
