//
//  CellWeek.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class CellWeek: UITableViewCell {

    @IBOutlet var LabelDateRange: UILabel
    @IBOutlet var weeklyReviewLabel: UILabel
    
    
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(stepHandler: StepDataHandler) {
        var weekAgo: NSDate = NSDate()
        weekAgo.dateByAddingTimeInterval(-604800)
        self.weeklyReviewLabel.font = UIFont.boldSystemFontOfSize(20)
        let df = NSDateFormatter()
        df.dateFormat = "MMMM dd"
        self.LabelDateRange.text = "From \(df.stringFromDate(weekAgo))"
        
    }

}
