//
//  StepDataHandler.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/17/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class StepDataHandler: NSObject {
    
    var numberOfSteps = Int();
    var numberOfMiles = Double();
    var numberOfCalories = Int();
//    var stepHistoryArray = Int[]();
    var totalAsSteps = Double();
    var averageAsSteps = Double();
    var bestAsSteps = Int();
    
    init() {
        
        
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
        
        if (numberOfMiles < 3 ) {
            return "You're almost at a 5k!"
        }
        // 5k
        if (numberOfMiles > 3 && numberOfMiles < 6) {
            return "That's a 5K!";
        }
         // 10k
        if (numberOfMiles > 6 && numberOfMiles < 7) {
            return "That's a 10K!";
        }
        if (numberOfMiles < 13) {
            return "That's a 10K! (and then some)"
        }
        // half marathon
        if (numberOfMiles > 13 && numberOfMiles <= 26) {
            var s: String = "That's a half marathon!"
            
            if (numberOfMiles  > 13.1) {
                s = s + "(and then some)";
            }
            
            return s;
        }
        // marathon
        if (numberOfMiles > 26 && numberOfMiles < 27) {
            return "That's an entire marathon!";
        }
        // x marathons
        if (numberOfMiles > 27 && numberOfMiles < 380) {
            var numOfMarathons = numberOfMiles / 26.2;
            return "That's \(numOfMarathons) marathons!"
            
        }
        // SF to LA (380)
        if (numberOfMiles > 380 && numberOfMiles < 650) {
            var s: String = "That's a trip from LA to San Fransisco!";
            
            if numberOfMiles > 400 {s = s + "(and then some)"};
            
            return s;
        }
        // 656 miles of NYC subway
        if (numberOfMiles > 650 && numberOfMiles < 2600) {
            var numOfTimesThroughSubway = numberOfMiles / 650;
            return "That's \(numOfTimesThroughSubway) trips in the NYC!"
        }
        // 2600 Across the US
        if (numberOfMiles >= 2600 && numberOfMiles < 24000) {
            var numOfTimesAcrossUS = numberOfMiles / 2600;
            return "That's \(numOfTimesAcrossUS) times acrossing the US!"
        }
        // 249000 Around the Earth
        if (numberOfMiles > 24000) {
            var numOfTimesAroundEarth = numberOfMiles / 249000;
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
