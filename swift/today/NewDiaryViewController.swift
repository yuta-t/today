//
//  NewDiaryViewController.swift
//  today
//
//  Created by YutaTadachi on 2015/05/13.
//  Copyright (c) 2015年 yuta-t. All rights reserved.
//

import UIKit


class NewDiaryViewController: UIViewController, UITextViewDelegate {
    
    let yellow = UIColor(red: 252 / 255, green: 253 / 255, blue: 253 / 255, alpha: 0.72)
    let black = UIColor(red: 58 / 255, green: 58 / 255, blue: 58 / 255, alpha: 1)
    let lightGray = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textField: UITextView!
    var diary = Diary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setForm()
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // HTTP
    func save() {
        var url = NSURL(string: "http://localhost:4000/diaries")
        var request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = "POST"

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var params: [String: AnyObject] = [
            "name": "ただち",
            "title": titleField.text,
            "text": textField.text
        ]
        
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: nil)
        
        var task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                var result = NSString(data: data, encoding: NSUTF8StringEncoding)!
            }
        })
        task.resume()
        close()
    }
    
    // From
    func setForm() {
        titleField.font = UIFont(name: "HiraKakuProN-W3", size: 18)
        titleField.layer.borderWidth = 1
        titleField.layer.borderColor = lightGray.CGColor
        titleField.layer.cornerRadius = 5
        
        textField.font = UIFont(name: "HiraKakuProN-W3", size: 18)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = lightGray.CGColor
        textField.layer.cornerRadius = 5
        
        textField.delegate = self
        textField.textColor = UIColor.lightGrayColor()
        textField.text = "本文"
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textField.textColor == UIColor.lightGrayColor() {
            textField.text = nil
            textField.textColor = UIColor.blackColor()
        }
    }
    
    
    // Navigationbar
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = yellow
        self.navigationController?.navigationBar.tintColor = black
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: black, NSFontAttributeName: UIFont(name: "HiraKakuProN-W3", size: 18)!]
        
        self.navigationItem.title = "日記を書く"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItemStyle.Plain, target: self, action: "close")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "contribute"), style: UIBarButtonItemStyle.Plain, target: self, action: "save")
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
}
