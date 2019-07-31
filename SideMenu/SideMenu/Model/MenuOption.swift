//
//  MenuOption.swift
//  SideMenu
//
//  Created by Jesus Medina on 5/8/19.
//  Copyright © 2019 Jesus Medina. All rights reserved.
//
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Settings
    case Notifications
    case About
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Settings: return "Settings"
        case .Notifications: return "Notifications"
        case .About: return "About Us"
            
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "icons8-user-50") ?? UIImage()
        case .Settings: return UIImage(named: "icons8-settings-50") ?? UIImage()
        case .Notifications: return UIImage(named: "icons8-notification-50") ?? UIImage()
        case .About: return UIImage(named: "icons8-about-50") ?? UIImage()
            
        }
    }
}
