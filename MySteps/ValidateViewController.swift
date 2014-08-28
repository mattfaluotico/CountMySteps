//
//  DetailViewController.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/12/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class ValidateViewController: UIViewController {

    @IBOutlet var detailDescriptionLabel: UILabel?

    @IBOutlet var nextButton: UIButton?
    @IBOutlet var countingStatusLabel: UILabel?
    
    required init(coder aDecoder: NSCoder)  {
        super.init(coder: aDecoder)
        
    }
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        
        self.navigationItem!.title = "Validating..."
        self.nextButton!.layer.backgroundColor = DAT_MAROON.CGColor
        self.nextButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.nextButton!.layer.cornerRadius = 5
        self.navigationItem!.setHidesBackButton(true, animated: false)
        
        var canCountSteps = true;
        
        if (!canCountSteps) {
            
            self.countingStatusLabel!.text = "Awesome! Looks like I will be able to count steps for you\n :)"
            self.nextButton!.enabled = true
            // set NSUser Defaults for validated
            
        } else {
            self.nextButton!.hidden = true
            self.countingStatusLabel!.text = "Looks like you don't have a motion tracking chip or denied me access to your motion data. I can't count your steps\n :("
            self.nextButton!.layer.backgroundColor = UIColor.grayColor().CGColor
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

