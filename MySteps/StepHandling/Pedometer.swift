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
    
    
    public func quertyStepsFromLastDate() {
        
        // gets the start of the day
        var cal = NSCalendar.autoupdatingCurrentCalendar()
        var components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:NSDate())
        var today = cal.dateFromComponents(components)
        
        var lastDate : NSDate? = NSUserDefaults.standardUserDefaults().objectForKey(LAST_TOUCHED_DAY) as? NSDate
        
        if(!lastDate) {
            lastDate = today
        }
        
        println("Diff: \(lastDate!.timeIntervalSinceNow)")
        
        if (lastDate!.timeIntervalSinceNow >= 604800) {
            println("More than 7 days ago")
            lastDate = today.dateByAddingTimeInterval(604800);
            components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:lastDate)
            lastDate = cal.dateFromComponents(components)
        }
        
        // Get all entried in database after lastTouchedDate
        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext as NSManagedObjectContext
        
        
        while (lastDate?.compare(today) != NSComparisonResult.OrderedSame) {
            
        }
        
        
        
        NSUserDefaults.standardUserDefaults().setObject(today, forKey: LAST_TOUCHED_DAY)
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
    
    class func canCountSteps() -> Bool {
        return CMPedometer.isStepCountingAvailable()
    }
    
}
