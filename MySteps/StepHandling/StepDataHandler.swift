//
//  StepDataHandler.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//


// This holds the array contaiing all steps

import UIKit
import CoreData
import CoreMotion

class StepDataHandler: NSObject {
    
    var stepCounter: CMPedometer?;
    
    var context: NSManagedObjectContext?
    var fetchedData: NSFetchedResultsController?;
    
    var history = NSArray();
    
    var numberOfSteps = Int()
    var distance : Double {
        get {
            // check if distance is available
            return 6
        }
        
        set(setDistnace) {
            self.distance = setDistnace
        }
    }
    
    var numberOfCalories = Int()
//    var stepHistoryArray = Int[]()
    var totalAsSteps = Double()
    var averageAsSteps = Double()
    var bestAsSteps = Int()
    var numberOfFloorsUp = Int()
    var numberOfFloorsDown = Int()
    
    
//    Temp data
    
    var temp_todaySteps = 3454
    var temp_todayCals = 354
    var temp_todayMiles = 3
    var temp_goal = 4000
    
    var temp_best_date = NSDate()
    var temp_besr_steps = 32424
    
    init(Bool) {
        
        super.init()
        self.stepCounter = CMPedometer();
        self.context = APP_DELEGATE.managedObjectContext;
        
        self.queryStepsFromLastTouchedDayToToday();
        self.loadAll();
        // TODO: Post notification
    }
    
    func realWorldDistance() -> String {
        
        if (distance < 3 ) {
            return "You're almost at a 5k!"
        }
        // 5k
        if (distance > 3 && distance < 6) {
            return "That's a 5K!";
        }
         // 10k
        if (distance > 6 && distance < 7) {
            return "That's a 10K!";
        }
        if (distance < 13) {
            return "That's a 10K! (and then some)"
        }
        // half marathon
        if (distance > 13 && distance <= 26) {
            var s: String = "That's a half marathon!"
            
            if (distance  > 13.1) {
                s = s + "(and then some)";
            }
            
            return s;
        }
        // marathon
        if (distance > 26 && distance < 27) {
            return "That's an entire marathon!";
        }
        // x marathons
        if (distance > 27 && distance < 380) {
            var numOfMarathons = distance / 26.2;
            return "That's \(numOfMarathons) marathons!"
            
        }
        // SF to LA (380)
        if (distance > 380 && distance < 650) {
            var s: String = "That's a trip from LA to San Fransisco!";
            
            if distance > 400 {s = s + "(and then some)"};
            
            return s;
        }
        // 656 miles of NYC subway
        if (distance > 650 && distance < 2600) {
            var numOfTimesThroughSubway = distance / 650;
            return "That's \(numOfTimesThroughSubway) trips in the NYC!"
        }
        // 2600 Across the US
        if (distance >= 2600 && distance < 24000) {
            var numOfTimesAcrossUS = distance / 2600;
            return "That's \(numOfTimesAcrossUS) times acrossing the US!"
        }
        // 249000 Around the Earth
        if (distance > 24000) {
            var numOfTimesAroundEarth = distance / 249000;
            return "That's \(numOfTimesAroundEarth) times around the earth!"
        }
        
        return "That's a whole ton of walking!";
    }
    
    // queries all of the steps into an array
    func loadAll() {
    
        var fetchRequest = NSFetchRequest(entityName: "StepDay");
    
        let sortDescriptor = NSSortDescriptor(key: "day", ascending: false);
        let sortDescriptors = [sortDescriptor];
        fetchRequest.sortDescriptors = [sortDescriptor];
    
        let e = NSErrorPointer();
    
        // Array of all dates
        self.history = self.context!.executeFetchRequest(fetchRequest, error: e);
        
        
    }
    
    // This is only called if there are more than 7 days between the last date and today.
    // This should only happen if the user disables background refresh and has not opened
    // the app in 7 days or more
    // or on the first launch
    private func queryStepsFromTheLast7Days() {
        
        var cal = NSCalendar.autoupdatingCurrentCalendar()
        var components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:NSDate())
        var today = cal.dateFromComponents(components)
        
        var comp = NSDateComponents()
        comp.day = -7
        
        var sevenDaysAgo : NSDate = cal.dateByAddingComponents(comp, toDate: today!, options: NSCalendarOptions.MatchNextTime);
        
        var iteratorDay = sevenDaysAgo;
        
        // update components to add date
        comp.day = 1;
        
        do {
            
            var startOfNextDay : NSDate = cal.dateByAddingComponents(comp, toDate: iteratorDay, options: NSCalendarOptions.MatchNextTime);
            
            stepCounter?.queryPedometerDataFromDate(iteratorDay, toDate: startOfNextDay, withHandler: { data, error in
            
            if(!(error != nil)) {
                
                var newSteps : StepDay = NSEntityDescription.insertNewObjectForEntityForName("StepDay", inManagedObjectContext: self.context) as StepDay;
                
                newSteps.day = iteratorDay;
                newSteps.steps = data.numberOfSteps;
                
                var e = NSErrorPointer();
                
                self.context?.save(e);
                
            } else {
                println("Error getting steps");
                }
            
                });
                
                iteratorDay = startOfNextDay;
            
        } while(iteratorDay.compare(today!) == NSComparisonResult.OrderedAscending);

        NSUserDefaults.standardUserDefaults().setObject(today!, forKey: LAST_TOUCHED_DAY);
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    // This update the database will all the new steps
    private func queryStepsFromLastTouchedDayToToday() {
        
        var lastTouchedDate = NSUserDefaults.standardUserDefaults().objectForKey(LAST_TOUCHED_DAY) as? NSDate;
        
        var cal = NSCalendar.autoupdatingCurrentCalendar()
        var components = cal.components(.DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit, fromDate:NSDate())
        var today = cal.dateFromComponents(components)
        
        var comp = NSDateComponents()
        comp.day = -7
        
        var sevenDaysAgo : NSDate = cal.dateByAddingComponents(comp, toDate: today!, options: NSCalendarOptions.MatchNextTime);
        
        if (lastTouchedDate != nil || lastTouchedDate!.compare(sevenDaysAgo) == NSComparisonResult.OrderedAscending ) {
            self.queryStepsFromTheLast7Days();
        } else {
            
            var fetchRequest = NSFetchRequest(entityName: "StepDay")
            comp.day = 1;
            
            // always the most recent day in the database
            let predicate = NSPredicate(format: "day >= %@", lastTouchedDate!);
            let sortDescriptor = NSSortDescriptor(key: "day", ascending: true)
            let sortDescriptors = [sortDescriptor]
            fetchRequest.sortDescriptors = [sortDescriptor]
            fetchRequest.predicate = predicate;
            
            let e = NSErrorPointer()
            
            // Array of all dates
            var stepDays : NSMutableArray = (self.context!.executeFetchRequest(fetchRequest, error: e) as NSArray).mutableCopy() as NSMutableArray

            var lastStepDay : StepDay = stepDays.objectAtIndex(0) as StepDay;
            
            var startOfNextDay : NSDate = cal.dateByAddingComponents(comp, toDate: lastStepDay.day, options: NSCalendarOptions.MatchNextTime);
            
            // update the last day
            self.stepCounter!.queryPedometerDataFromDate(lastStepDay.day, toDate: startOfNextDay, withHandler: {
                data, error in
                
                if (error != nil) {
                    lastStepDay.steps = data.numberOfSteps;
                    
                }
                
                var e = NSErrorPointer();
                self.context!.save(e);
                });
            
            var iteratorDate: NSDate = startOfNextDay;
            
            do {
                
                startOfNextDay = cal.dateByAddingComponents(comp, toDate: iteratorDate, options: NSCalendarOptions.MatchNextTime);
                
            stepCounter!.queryPedometerDataFromDate(iteratorDate, toDate: startOfNextDay, withHandler: { data, error in
                
                var newSteps : StepDay = NSEntityDescription.insertNewObjectForEntityForName("StepDay", inManagedObjectContext: self.context) as StepDay;
                
                newSteps.day = iteratorDate;
                newSteps.steps = data.numberOfSteps;
                
                var e = NSErrorPointer();
                
                self.context?.save(e);
                
                });
            
                iteratorDate = startOfNextDay;
                
            } while (iteratorDate.compare(today!) == NSComparisonResult.OrderedAscending)
        }
        
    }
   
}
