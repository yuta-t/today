//
//  DiaryTableViewCell.swift
//  today
//
//  Created by YutaTadachi on 2015/05/13.
//  Copyright (c) 2015年 yuta-t. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    var diary = Diary()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.text = diary.title
        nameLabel.text = diary.name
        dateLabel.text = conversionDateFormat(diary.datetime)
    }
    
    // DateFormat
    func conversionDateFormat(dateString: String) -> String {
        let inputFormatter = NSDateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date: NSDate? = inputFormatter.dateFromString(dateString)
        
        let outputFormatter = NSDateFormatter()
        outputFormatter.dateFormat = "yyy/MM/dd HH:mm"
        let outputDateString = outputFormatter.stringFromDate(date!)
        return outputDateString
    }
    
}
