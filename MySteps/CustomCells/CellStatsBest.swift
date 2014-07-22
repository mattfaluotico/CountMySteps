//
//  CellStatsBest.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/22/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class CellStatsBest: UITableViewCell {

    @IBOutlet var LabelBestDay: UILabel?
    @IBOutlet var LabelBestSteps: UILabel?
    @IBOutlet var LabelBestDistance: UILabel?
    @IBOutlet var LabelBestCals: UILabel?
    
    
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
    
    
    func configCell(stepData: StepDataHandler) {
        
        var bestDay = NSMutableAttributedString (string: "Your best day was MM/dd/yyyy")
        LabelBestSteps!.text = "Steps: 542345"
        LabelBestDistance!.text = "Distance: 23 mi"
        LabelBestCals!.text = "Calories: 452 cal"
        
        
    }

}
	