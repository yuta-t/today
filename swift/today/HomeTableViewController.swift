//
//  TopTableViewController.swift
//  today
//
//  Created by YutaTadachi on 2015/05/13.
//  Copyright (c) 2015年 yuta-t. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    let yellow = UIColor(red: 252 / 255, green: 253 / 255, blue: 253 / 255, alpha: 0.72)
    let black = UIColor(red: 58 / 255, green: 58 / 255, blue: 58 / 255, alpha: 1)
    
    var diaries: Array<Diary> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTabBar()
        
        self.tableView.registerNib(UINib(nibName: "DiaryTableViewCell", bundle: nil), forCellReuseIdentifier: "DiaryTableViewCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
            self.loadDiaries()
    }
    
    override func viewDidAppear(animated: Bool) {
            self.loadDiaries()
    }
    
    // Action
    func newDiary() {
        self.performSegueWithIdentifier("ModalNewDiaryViewController", sender: self)
    }
    
    
    
    // Navigationbar
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = yellow
        self.navigationController?.navigationBar.tintColor = black
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: black, NSFontAttributeName: UIFont(name: "HiraKakuProN-W6", size: 15)!]
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "new"), style: UIBarButtonItemStyle.Plain, target: self, action: "newDiary")
    }

    // TabBar
    func setTabBar() {
        self.tabBarController?.tabBar.barTintColor = yellow
        self.tabBarController?.tabBar.tintColor = black
    }
    
    // TableView
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diaries.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DiaryTableViewCell", forIndexPath: indexPath) as! DiaryTableViewCell
        cell.diary = diaries[indexPath.row]
        cell.setNeedsLayout()
        
        return cell
    }
    
    // HTTP
    func loadDiaries() {
        let url = NSURL(string: "http://localhost:4000/diaries.json")
        var request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = "GET"
        
        var task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, responce, error) -> Void in
            
            if (error == nil) {
                self.diaries.removeAll(keepCapacity: false)
                var diaries = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! Array<Dictionary<String, AnyObject>>
            
                for diaryInfo in diaries {
                    let diary = Diary(attributes: diaryInfo)
                    self.diaries.append(diary)
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            } else {
                // when error
            }
        })
        task.resume()
    }

    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //    }
 }
