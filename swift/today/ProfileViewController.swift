//
//  ProfileViewController.swift
//  today
//
//  Created by YutaTadachi on 2015/05/13.
//  Copyright (c) 2015年 yuta-t. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let yellow = UIColor(red: 252 / 255, green: 253 / 255, blue: 253 / 255, alpha: 0.72)
    let black = UIColor(red: 58 / 255, green: 58 / 255, blue: 58 / 255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }

    // Navigation
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = yellow
        self.navigationController?.navigationBar.tintColor = black
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: black, NSFontAttributeName: UIFont(name: "HiraKakuProN-W3", size: 15)!]
        
        self.navigationItem.title = "プロフィール"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
