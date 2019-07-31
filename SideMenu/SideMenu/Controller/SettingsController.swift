//
//  SettingsController.swift
//  SideMenu
//
//  Created by Jesus Medina on 5/10/19.
//  Copyright © 2019 Jesus Medina. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    
    
    //Mark : Properties

    
    //Mark : Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK : Handler
    
    func configureUI() {
        view.backgroundColor = .white

        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-delete-filled-50").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
        print("Exiting Settings")
    }
    

}
    

