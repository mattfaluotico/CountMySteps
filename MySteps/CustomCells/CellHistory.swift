//
//  CellHistory.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class CellHistory: UITableViewCell {

//    Labels
    
    @IBOutlet var LabalSteps: UILabel
    @IBOutlet var LabelDistance: UILabel
    @IBOutlet var LabelCalories: UILabel
    @IBOutlet var LabelDate: UILabel
    
    
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.awakeFromNib()
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
    
    
    func configCell(stepHandler: StepDataHandler, index: Int) {
        
        let hl = "HelveticaNeue-Thin"
        let smallFont = NSDictionary(object: UIFont(name: hl, size: 14), forKey: NSFontAttributeName)
        let largeFont = NSDictionary(objects: [UIFont(name: hl, size: 19), UIColor.blackColor()], forKeys: [NSFontAttributeName, NSForegroundColorAttributeName])
        
        var calValue = "\(5354)"
        var distValue = "\(4234)"
        var stepsValue = "\(88984)"
        var calAttString = NSMutableAttributedString(string: "\(calValue) cal")
        var distAttString = NSMutableAttributedString(string: "\(distValue) mi")
        var stepsAttString = NSMutableAttributedString(string: "\(stepsValue) steps")
        
        calAttString.addAttributes(largeFont, range: NSMakeRange(0, countElements(calValue)))
        calAttString.addAttributes(smallFont, range: NSMakeRange(countElements(calValue), 4))
        
        distAttString.addAttributes(largeFont, range: NSMakeRange(0, countElements(distValue)))
        distAttString.addAttributes(smallFont, range: NSMakeRange(countElements(distValue), 3))
        
        stepsAttString.addAttributes(largeFont, range: NSMakeRange(0, countElements(stepsValue)))
        stepsAttString.addAttributes(smallFont, range: NSMakeRange(countElements(stepsValue), 6))
        
        LabelCalories.attributedText = calAttString
        LabelDistance.attributedText = distAttString
        LabalSteps.attributedText = stepsAttString
    }

}
