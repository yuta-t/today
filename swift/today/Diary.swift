//
//  Diary.swift
//  today
//
//  Created by YutaTadachi on 2015/05/13.
//  Copyright (c) 2015年 yuta-t. All rights reserved.
//

import UIKit

class Diary: NSObject {
    var title = ""
    var name = ""
    var text = ""
    var datetime = ""
    
    override init() {
        super.init()
    }
    
    init(attributes atr: Dictionary<String, AnyObject>) {
        super.init()
        
        self.title = atr["title"] as! String
        self.name = atr["name"] as! String
        self.text = atr["text"] as! String
        self.datetime = atr["created_at"] as! String
    }
}
