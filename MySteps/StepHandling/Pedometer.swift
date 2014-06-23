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
    
    init() {
        
        
    }
    
    func getTodaysStep() {
        
        stepCounter.startPedometerUpdatesFromDate(NSDate(), withHandler: { data, error in
            if !error {
            println("Steps Taken: \(data.numberOfSteps)")
            
            let distance = data.distance.doubleValue
            
            let time = data.endDate.timeIntervalSinceDate(data.startDate)
            
            let speed = distance / time
                
            }
            });
    }
    
    // Get Steps Today
    
    // Get Floors Today
    
    // get distance today
    
    
    
}
