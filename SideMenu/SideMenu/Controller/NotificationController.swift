//
//  NotificationController.swift
//  SideMenu
//
//  Created by Jesus Medina on 5/11/19.
//  Copyright © 2019 Jesus Medina. All rights reserved.
//

import UIKit

class NotificationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Notifications"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-delete-filled-50").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
        print("Exiting Notifications")
    }
    
    
    
    
    
}
