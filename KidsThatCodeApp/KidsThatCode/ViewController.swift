//
//  ViewController.swift
//  KidsThatCode
//
//  Created by Hector Diaz on 6/21/18.
//  Copyright © 2018 KidsThatCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sideMenuTapped(_ sender: Any) {
        if (menuShowing) {
            leadingConstraint.constant = -270
        }
        else {
            leadingConstraint.constant = 0
        }
        menuShowing = !menuShowing
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

