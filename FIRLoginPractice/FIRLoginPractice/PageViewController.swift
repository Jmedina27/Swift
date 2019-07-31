//
//  PageViewController.swift
//  FIRLoginPractice
//
//  Created by Jesus Medina on 9/8/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        if (menuShowing) {
            leadingConstraint.constant = -290
        }
        else {
            leadingConstraint.constant = 0
        }
        
        menuShowing = !menuShowing
        
    }
    
    

}
