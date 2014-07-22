//
//  CellStats.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class CellStatsAverage: UITableViewCell {

    @IBOutlet var LabelAverageSteps: UILabel?
    @IBOutlet var LabelAverageCaloriesAndDistance: UILabel?
    
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
        var numString = "\(125234)"
        var numStringLength = countElements(numString)
        var redFont = NSDictionary(object: DAT_MAROON, forKey: NSForegroundColorAttributeName)
        
        var averageSteps = NSMutableAttributedString(string: "On average, you're walking \(numString) steps a day")
        averageSteps.setAttributes(redFont, range: NSMakeRange(27, numStringLength))
        
        self.LabelAverageSteps!.attributedText = averageSteps
        
        
        var caloriesAndDistanceAttributeString = NSMutableAttributedString(string: "That's \(numString) calories and \(numString) miles")
        caloriesAndDistanceAttributeString.setAttributes(redFont, range: NSMakeRange(7, numStringLength))
        caloriesAndDistanceAttributeString.setAttributes(redFont, range: NSMakeRange(7 + numStringLength + 14, numStringLength))
        
        self.LabelAverageCaloriesAndDistance!.attributedText = caloriesAndDistanceAttributeString

    }

}
