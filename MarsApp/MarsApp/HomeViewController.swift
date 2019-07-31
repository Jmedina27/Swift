//
//  HomeViewController.swift
//  MarsApp
//
//  Created by Jesus Medina on 10/18/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   let imageView = UIImageView(image: UIImage(named: "iosBackground"))
    imageView.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
    view.addSubview(imageView)
    imageView.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin, .flexibleBottomMargin]
    
   let logoutButton = UIButton(frame: CGRect(x: 207, y: 825, width: 24, height: 20))
        logoutButton.layer.cornerRadius = logoutButton.frame.height / 2
        logoutButton.backgroundColor = UIColor.red
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 20)
        logoutButton.addTarget(self, action: #selector(self.logoutButtonTapped), for: .touchUpInside)
        logoutButton.autoresizingMask = [.flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleTopMargin, .flexibleHeight, .flexibleWidth]
        logoutButton.showsTouchWhenHighlighted = true
        self.view.addSubview(logoutButton)
        
        
        
    }
    @IBAction func logoutButtonTapped(sender: Any) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
