//
//  StepDataHandler.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit
import CoreData

class StepDataHandler: NSObject {
    
    var managedObject: NSManagedObjectContext?
    
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
        
        self.managedObject = APP_DELEGATE.managedObjectContext
        
    }
    
    init() {
        
        super.init()
        
        var pedometer = Pedometer();
//        pedometer.getTodaysStep();
        numberOfSteps = pedometer.steps.integerValue;
        
        if (pedometer.distance) {
            distance = pedometer.distance!.doubleValue;
        } else {
//            distance = StepConversion.stepsToMiles(numberOfSteps)
        }
        
        if (pedometer.floorsDown) {
            numberOfFloorsDown = pedometer.floorsDown!.integerValue;
        } else {
            numberOfFloorsDown = 0;
        }
        
        if (pedometer.floorsUp) {
            numberOfFloorsUp = pedometer.floorsUp!.integerValue;
        } else {
            numberOfFloorsUp = 0;
        }
    }

    // MARK: Sending information back to the view controllers
    
    // Return Todays Steps
    
    // Return Today distance 
    
    // Return Today calories
    
    // Return Last 7 days as array
    
    // Return all days as sorted array HISTORY
    
    // Return Best Day
    
    // Return Average
    
    // Return Total
    
    // Return Total as it relates to real world walking
    
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
    
    // ------------------------------------------------------------------
    
    // MARK: Getting step data from the Pedometer class
    
    // Get Step Data
    
    // MARK: Updating the database
    
    // Get access to the database
    
    // Update the database
    
    // MARK: Getting information from the Database
    
    // Iterate over DB and assign best, average, and total
    
    // MARK: Get stats from user settings
   
}
