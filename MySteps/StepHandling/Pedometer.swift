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
    
    
    var weeklySteps = NSMutableDictionary()
    
    
    func loadStep() {
        
        var cal = NSCalendar.autoupdatingCurrentCalendar();
        var components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:NSDate());
        var startOfDay = cal.dateFromComponents(components);
        var endOfDay = NSDate()
        
        var days = 7
        
        var waitForSteps : dispatch_semaphore_t = dispatch_semaphore_create(0)
        
        for daysBack in 0..<days {
            
            stepCounter.queryPedometerDataFromDate(startOfDay, toDate: endOfDay, withHandler: { data, error in
                
                if (!error) {
                    var b: Int = daysBack
                    b = b * 86400
                    var d: NSDate = startOfDay.dateByAddingTimeInterval( Double(b))
                    self.weeklySteps.setObject(0, forKey: d)
                } else {
                    self.weeklySteps.setObject(0, forKey: startOfDay)
                }
                
                if (daysBack == 6) {dispatch_semaphore_signal(waitForSteps)}
                
                });
        }
        
        dispatch_semaphore_wait(waitForSteps, DISPATCH_TIME_FOREVER)
        
        println(weeklySteps)
        
    }
    
//        stepCounter.startPedometerUpdatesFromDate(startOfDay, withHandler: { data, error in
//            
//            if (!error) {
//                
//                self.steps = data.numberOfSteps;
//                
//                self.steps = data.numberOfSteps
////                self.day = data.startDate
//                
//                if CMPedometer.isDistanceAvailable() {
//                    self.distance = data.distance;
//                }
//                
//                if CMPedometer.isFloorCountingAvailable() {
//                    self.floorsUp = data.floorsAscended;
//                    self.floorsDown = data.floorsAscended;
//                }
//
//                dispatch_semaphore_signal(waitForSteps)
//            } else {
//                println("Error collecting steps");
//            }
//            
//            
//            });
//        
//        dispatch_semaphore_wait(waitForSteps, DISPATCH_TIME_FOREVER)
//        
//        print(self.steps)
//    }
    
    class func canCountSteps() -> Bool {
        return CMPedometer.isStepCountingAvailable()
    }
    
}
