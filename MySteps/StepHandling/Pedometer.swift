////
////  Pedometer.swift
////  MySteps
////
////  Created by Matthew Faluotico on 6/17/14.
////  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
////
//
//import UIKit
//import CoreMotion
//
//class Pedometer: NSObject {
//   
//    let stepCounter = CMPedometer();
//    
//    var steps = NSNumber();
//    var distance = NSNumber?();
//    var floorsUp = NSNumber?();
//    var floorsDown = NSNumber?();
//    
//    
//    public func queryThis() {
//        
//        var lastTouchedDate : NSDate? = NSUserDefaults.standardUserDefaults().objectForKey(LAST_TOUCHED_DAY) as? NSDate;
//        
//        var cal = NSCalendar.autoupdatingCurrentCalendar()
//        var components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:NSDate())
//        var today = cal.dateFromComponents(components)
//        
//        var comp = NSDateComponents()
//        comp.day = 7
//        
//        var sevenDaysAgo : NSDate = cal.dateByAddingComponents(comp, toDate: today, options: NSCalendarOptions.MatchNextTime);
//        print(sevenDaysAgo);
//        
//    }
//    
//    public func quertyStepsFromLastDateToNow() {
//        
//        // gets the start of the day
//        var cal = NSCalendar.autoupdatingCurrentCalendar()
//        var components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:NSDate())
//        var today = cal.dateFromComponents(components)
//        
//        var lastDate : NSDate? = NSUserDefaults.standardUserDefaults().objectForKey(LAST_TOUCHED_DAY) as? NSDate
//        
//        if(!lastDate) {
//            lastDate = today
//        }
//        
//        println("Diff: \(lastDate!.timeIntervalSinceNow)")
//        
//        // if the last day was more than 7 days ago, we set it to 7 days ago.
//        if (lastDate!.timeIntervalSinceNow >= 604800) {
//            println("More than 7 days ago")
//            lastDate = today.dateByAddingTimeInterval(604800);
//            components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:lastDate)
//            lastDate = cal.dateFromComponents(components)
//        }
//        
//        // Get all entried in database after lastTouchedDate
//        var context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext as NSManagedObjectContext
//        var fetchRequest = NSFetchRequest(entityName: "StepDay")
//        
//        let sortDescriptor = NSSortDescriptor(key: "day", ascending: false)
//        let sortDescriptors = [sortDescriptor]
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        
//        let e = NSErrorPointer()
//        
//        // Array of all dates
//        var stepDays : NSMutableArray = (context.executeFetchRequest(fetchRequest, error: e) as NSArray).mutableCopy() as NSMutableArray
//        
//        var comp = NSDateComponents()
//        comp.day = 1
//        
//        // iterate through days that have not been touched and add the to the database.
//        do {
//            var startOfTheNextDay = cal.dateByAddingComponents(comp, toDate: lastDate, options: NSCalendarOptions.MatchNextTime) as NSDate
//            
//            stepCounter.queryPedometerDataFromDate(lastDate, toDate: startOfTheNextDay, withHandler: { data, error in
//                if (!error) {
//                    
//                    var newStepDay : StepDay = NSEntityDescription.insertNewObjectForEntityForName("StepDay", inManagedObjectContext: context) as StepDay
//                    
//                    newStepDay.steps = data.numberOfSteps
//                    newStepDay.day = data.startDate
//                    
//                    var e = NSErrorPointer()
//                    context.save(e)
//                    
//                } else {
//                    println("Error counting steps")
//                    }
//                });
//            
//            lastDate = startOfTheNextDay;
//            
//        } while (lastDate?.compare(today) != NSComparisonResult.OrderedSame);
//        
//        NSUserDefaults.standardUserDefaults().setObject(today, forKey: LAST_TOUCHED_DAY);
//        NSUserDefaults.standardUserDefaults().synchronize();
//    }
//    
////    func loadStep() {
////        
////        var cal = NSCalendar.autoupdatingCurrentCalendar();
////        var components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:NSDate());
////        var startOfDay = cal.dateFromComponents(components);
////        var endOfDay = NSDate()
////        
////        var days = 7
////        
////        var waitForSteps : dispatch_semaphore_t = dispatch_semaphore_create(0)
////        
////        for daysBack in 0..<days {
////            
////            stepCounter.queryPedometerDataFromDate(startOfDay, toDate: endOfDay, withHandler: { data, error in
////                
////                if (!error) {
////                    var b: Int = daysBack
////                    b = b * 86400
////                    var d: NSDate = startOfDay.dateByAddingTimeInterval( Double(b))
////                    self.weeklySteps.setObject(0, forKey: d)
////                } else {
////                    self.weeklySteps.setObject(0, forKey: startOfDay)
////                }
////                
////                if (daysBack == 6) {dispatch_semaphore_signal(waitForSteps)}
////                
////                });
////        }
////        
////        dispatch_semaphore_wait(waitForSteps, DISPATCH_TIME_FOREVER)
////        
////        println(weeklySteps)
////        
////    }
//    
//    class func canCountSteps() -> Bool {
//        return CMPedometer.isStepCountingAvailable()
//    }
//    
//    
//    public func queryLast7Days() {
//        
//    }
//}
