//
//  CellToday.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class CellToday: UITableViewCell {
    
    @IBOutlet var LabelGoalStatus: UILabel
    
    @IBOutlet var ButtonJumpToHistory: UIButton
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.configCell()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configCell() {
//        self.ButtonJumpToHistory.frame.size = CGSizeMake(250, 40)
        
        self.ButtonJumpToHistory.layer.backgroundColor = DAT_MAROON.CGColor
        self.ButtonJumpToHistory.layer.cornerRadius = self.ButtonJumpToHistory.frame.height / 2
        self.ButtonJumpToHistory.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        var goalReached = true;
        self.LabelGoalStatus.text = self.motivateForGoalReach(goalReached)
        
        self.ButtonJumpToHistory.addTarget(self.superview, action: "scroll", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    func motivateForGoalReach(goalReached: Bool) -> String {
        var motivateString = String()
        
        if (goalReached) {
            var randOut = rand();
            
            switch (randOut) {
            case 0: motivateString = "You got this!"
            case 1: motivateString = "You can do it!"
            case 2: motivateString = "You're close!"
            case 3: motivateString = "Make it look easy"
            default: motivateString = "woohoo!"
            }
            
        } else {
                motivateString = "Nice job"
            }
        
        return motivateString
    }

}



