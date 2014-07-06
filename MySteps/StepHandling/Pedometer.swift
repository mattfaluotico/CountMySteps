//
//  Pedometer.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit
import CoreMotion

class Pedometer: NSObject {
   
    let stepCounter = CMPedometer();
    
    var steps = NSNumber();
    var distance = NSNumber?();
    var floorsUp = NSNumber?();
    var floorsDown = NSNumber?();
    
    init() {
        
        
    }
    
    func getTodaysStep() {
        
        var cal = NSCalendar.autoupdatingCurrentCalendar();
        var components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:NSDate());
        var startOfDay = cal.dateFromComponents(components);
        
        
        stepCounter.startPedometerUpdatesFromDate(startOfDay, withHandler: { data, error in
            
            if (!error) {
                
                self.steps = data.numberOfSteps;
                
                if CMPedometer.isDistanceAvailable() {
                    self.distance = data.distance;
                }
                
                if CMPedometer.isFloorCountingAvailable() {
                    self.floorsUp = data.floorsAscended;
                    self.floorsDown = data.floorsAscended;
                }

                
            } else {
                println("Error collecting steps");
            }
            
            
            });
    }
    
    class func canCountSteps() -> Bool {
        return CMPedometer.isStepCountingAvailable()
    }
    
}
