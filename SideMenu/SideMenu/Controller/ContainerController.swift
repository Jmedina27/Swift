//
//  ContainerController.swift
//  SideMenu
//
//  Created by Jesus Medina on 5/6/19.
//  Copyright © 2019 Jesus Medina. All rights reserved.
//

import UIKit


class ContainerController: UIViewController {
    //Mark: - Properties
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    //Mark: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    //Mark: - Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        
        addChild(centerController)
        centerController.didMove(toParent: self)
    }

    
    func configureMenuController() {
        if (menuController == nil) {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if (shouldExpand) {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                
            }, completion: nil)
        }
        else {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Profile:
            print("Show Profile")
            let controller = ProfileController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        case .Settings:
            print("Show Settings")
            let controller = SettingController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        case .Notifications:
            print("Show Notification")
            let controller = NotificationController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        case .About:
            print("Show About")
            let controller = AboutController()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
            
        }, completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
    func handleMenuToggle() {
        
        
    }
}

