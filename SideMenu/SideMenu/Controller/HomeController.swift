//
//  HomeController.swift
//  SideMenu
//
//  Created by Jesus Medina on 5/6/19.
//  Copyright © 2019 Jesus Medina. All rights reserved.
//
import UIKit

class HomeController: UIViewController {
    //Mark: - Properties
    
    var delegate: HomeControllerDelegate?
    //Mark: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        configureNavigationBar()
    }
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    func configureNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-filled-48").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    
    //Mark: - Handlers
}

