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

}
