//
//  CellWeek.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class CellWeek: UITableViewCell {

    @IBOutlet var LabelDateRange: UILabel?
    @IBOutlet var weeklyReviewLabel: UILabel?
    
    
    
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
        self.weeklyReviewLabel!.font = UIFont.boldSystemFontOfSize(20)
        let df = NSDateFormatter()
        df.dateFormat = "MMM. dd"
        self.LabelDateRange!.text = "Steps per day from \(df.stringFromDate(weekAgo))"
        
        drawChart()
        
        
    }
    
    func drawChart() {
        
        println("Stroke Bar Chart")
        
        var barChart = PNBarChart(frame: CGRectMake(0, 75, 320.0, 240.0))
        barChart.xLabels = [" 1"," 2"," 3"," 4"," 5"," 6"]
        barChart.yValues = [132,12324,13222,11238,33210,1320]
        barChart.backgroundColor = UIColor.clearColor()
        
        
        barChart.strokeChart()
        
        self.addSubview(barChart)
        
    }
}
