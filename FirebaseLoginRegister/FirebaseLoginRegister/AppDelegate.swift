//
//  AppDelegate.swift
//  FirebaseLoginRegister
//
//  Created by Jesus Medina on 8/29/18.
//  Copyright © 2018 Jesus Medina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }


}

