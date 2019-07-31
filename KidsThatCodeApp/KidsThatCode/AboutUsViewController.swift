//
//  AboutUsViewController.swift
//  KidsThatCode
//
//  Created by Hector Diaz on 6/21/18.
//  Copyright © 2018 KidsThatCode. All rights reserved.
//

import UIKit
import WebKit

class AboutUsViewController: UIViewController {
    

    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://kidsthatcode.org/our-story/")
        let request = URLRequest(url: url!)
        webview.load(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
