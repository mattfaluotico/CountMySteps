//
//  CellToday.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class CellToday: UITableViewCell {
    
    @IBOutlet var LabelGoalStatus: UILabel!
    
    @IBOutlet var LabelCalories: UICountingLabel!
    @IBOutlet var LabelMiles: UICountingLabel!
    @IBOutlet var ButtonJumpToHistory: UIButton!
    
//    var parentTable = UITableViewController()
    
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
    
    
    func configCell(stepData: StepDataHandler, parentTable: UITableViewController) {
//        self.ButtonJumpToHistory.frame.size = CGSizeMake(250, 40)
        
//        self.parentTable = parentTable
        
        println("Config Today")
        
        self.ButtonJumpToHistory.layer.backgroundColor = DAT_MAROON.CGColor
        self.ButtonJumpToHistory.layer.cornerRadius = self.ButtonJumpToHistory.frame.height / 2
        self.ButtonJumpToHistory.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
      
        
        
        var goal = stepData.temp_goal
        var todaySteps = stepData.temp_todaySteps
        
        var goalReached = (goal < todaySteps);
        var goalLabel = CellToday.motivateForGoalReach(goalReached)
        
        var l : Int  = countElements(goalLabel)
        
        var boldAttDic = NSDictionary(object: UIFont.boldSystemFontOfSize(19.0), forKey: NSFontAttributeName)
        
        
        if (!goalReached) {
            goalLabel+="\nYou're \(goal-todaySteps) steps away from your goal."
        } else {
            goalLabel+="\nYou reached your goal."
        }
        
        var goalLabelAtt = NSMutableAttributedString(string: goalLabel)
        goalLabelAtt.addAttributes(boldAttDic, range: NSMakeRange(0, l))
        
        self.LabelGoalStatus.attributedText = goalLabelAtt
        
        self.ButtonJumpToHistory.addTarget(parentTable, action: "scroll", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.LabelCalories.format = "%d cal"
        self.LabelMiles.format = "%d mi"
        self.LabelCalories.countFrom(0, to: 2234, withDuration: 2)
        self.LabelMiles.countFrom(0, to: 4224, withDuration: 2)
    
        drawChart()
    }
    
    
    class func motivateForGoalReach(goalReached: Bool) -> String {
        var motivateString = String()
        
        if (!goalReached) {
            var randOut = rand() % 4
            
            switch (randOut) {
                case 0: motivateString = "You got this!"
                case 1: motivateString = "You can do it!"
                case 2: motivateString = "You're close!"
                case 3: motivateString = "Make it look easy!"
                default: motivateString = "Woohoo!"
            }
            
        } else {
            var randOut = rand() % 4;
            
            switch (randOut) {
                case 0: motivateString = "Nice job!"
                case 1: motivateString = "High five!"
                case 2: motivateString = "You made it!"
                case 3: motivateString = "You made that look easy"
                default: motivateString = "Woohoo!"
                }
            }
        
        return motivateString
    }
    
    
    func drawChart() {
        
        
        var circleChart = PNCircleChart(frame: CGRectMake(30, 20, 200, 200), andTotal: 100, andCurrent: 200, andClockwise: true, andShadow: true)
        circleChart.backgroundColor = UIColor.clearColor()
        circleChart.strokeColor = DAT_MAROON
        circleChart.lineWidth = 20
        circleChart.labelColor = UIColor.darkGrayColor()
        circleChart.strokeChart()
        
        self.addSubview(circleChart)
        
    }

    
    
    }



