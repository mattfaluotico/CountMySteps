//
//  CellStatsTotal.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/22/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class CellStatsTotal: UITableViewCell {

    @IBOutlet var LabelTotal: UILabel?
    @IBOutlet var LabelTotalRef: UILabel?
    
    
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
        
        var steps = "\(2900)"
        var distance = "\(4323)"
        var calories = "\(3434)"
        
        var stepsLength = countElements(steps)
        var distanceLength = countElements(distance)
        var caloriesLength = countElements(calories)
        
        
        var s = NSMutableAttributedString(string: "You've walked a total of \(steps) steps, \(distance) miles, and \(calories) calories.")
        var bold = NSDictionary(object: DAT_MAROON, forKey: NSForegroundColorAttributeName)
        s.addAttributes(bold, range: NSMakeRange(25, stepsLength))
        s.addAttributes(bold, range: NSMakeRange(25 + stepsLength +  8, distanceLength))
        s.addAttributes(bold, range: NSMakeRange(25 + stepsLength + 8 + distanceLength + 12, caloriesLength))
        
        self.LabelTotalRef!.text = stepHandler.realWorldDistance()
        self.LabelTotal!.attributedText = s
    }

}
