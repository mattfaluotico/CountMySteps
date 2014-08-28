//
//  MasterViewController.swift
//  MySteps
//
//  Created by Matthew Faluotico on 6/12/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var managedObjectContext: NSManagedObjectContext? = nil
    
    var stepHandler : StepDataHandler? = nil;

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepHandler = StepDataHandler(true);
        
        
        // Register NIBS
        var nib = UINib(nibName: "CellToday", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "CellToday")
        
        nib = UINib(nibName: "CellWeek", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "CellWeek")
        
        nib = UINib(nibName: "CellStatsAverage", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "CellStatsAverage")
        
        nib = UINib(nibName: "CellStatsBest", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "CellStatsBest")
        
        nib = UINib(nibName: "CellStatsTotal", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "CellStatsTotal")
        
        nib = UINib(nibName: "CellHistory", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "CellHistory")
        
        // Background view
        var backgroundView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        backgroundView.backgroundColor = UIColor.grayColor()
        var label = UILabel(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height - 50, UIScreen.mainScreen().bounds.width, 50))
        label.text = "Always Keep Moving :)"
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 19)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        backgroundView.addSubview(label)
        
        self.tableView.backgroundView = backgroundView
        
        // Set Nav Label
        var fancyNavLabel = UILabel()
        var titleLabelText = NSMutableAttributedString(string: "Count My Steps")
        var boldAttDic = NSDictionary(object: UIFont.boldSystemFontOfSize(24.0), forKey: NSFontAttributeName)
        var thinAttDic = NSDictionary(object: UIFont(name: "HelveticaNeue-Thin", size: 24.0), forKey: NSFontAttributeName);
        titleLabelText.setAttributes(boldAttDic, range: NSMakeRange(6, 2))
        titleLabelText.setAttributes(thinAttDic, range: NSMakeRange(0, 5))
        titleLabelText.setAttributes(thinAttDic, range: NSMakeRange(9, 5))
        
        fancyNavLabel.attributedText = titleLabelText
        fancyNavLabel.textColor = UIColor.whiteColor()
        fancyNavLabel.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = fancyNavLabel;
        fancyNavLabel.sizeToFit()
        
        // Settings button setup
        
        // Share button setup
        let shareButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "l")
        shareButton.style = .Bordered
        shareButton.tintColor = UIColor.whiteColor()
        self.navigationItem.rightBarButtonItem = shareButton
                
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, didEndDisplayingCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        if (indexPath.row < INDEX_HISTORY_CELL ) {
            println("remove cell at index \(indexPath.row)")
            cell.removeFromSuperview()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let sectionInfo = self.fetchedResultsController.sections[section] as NSFetchedResultsSectionInfo
//        return sectionInfo.numberOfObjects
        return 7
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()

        
        if (indexPath.row >= INDEX_HISTORY_CELL) {
            cell = tableView.dequeueReusableCellWithIdentifier("CellHistory") as CellHistory
            (cell as CellHistory).configCell(stepHandler!, index: 1)
            return cell;
        }
        
        switch(indexPath.row) {
        
        case INDEX_TODAY_CELL:
            cell = tableView.dequeueReusableCellWithIdentifier("CellToday") as CellToday
            (cell as CellToday).configCell(stepHandler!, parentTable: self)
        case INDEX_WEEK_CELL:
            cell = tableView.dequeueReusableCellWithIdentifier("CellWeek") as CellWeek
            (cell as CellWeek).configCell(stepHandler!)
        case INDEX_STATS_AVERAGE_CELL:
            cell = tableView.dequeueReusableCellWithIdentifier("CellStatsAverage") as CellStatsAverage
            (cell as CellStatsAverage).configCell(stepHandler!)
        case INDEX_STATS_BEST_CELL:
            cell = tableView.dequeueReusableCellWithIdentifier("CellStatsBest") as CellStatsBest
            (cell as CellStatsBest).configCell(stepHandler!)
        case INDEX_STATS_TOTAL_CELL:
            cell = tableView.dequeueReusableCellWithIdentifier("CellStatsTotal") as CellStatsTotal
            (cell as CellStatsTotal).configCell(stepHandler!)
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("CellHistory") as CellHistory
        }
        
        return cell;
        
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        var height = CGFloat()
        
        if (indexPath.row >= INDEX_HISTORY_CELL) {
            height = HEIGHT_HISTORY_CELL;
            return height;
        }
        
        switch (indexPath.row) {
            case INDEX_TODAY_CELL:
            height = HEIGHT_TODAY_CELL
            case INDEX_WEEK_CELL:
            height = HEIGHT_WEEK_CELL
            case INDEX_STATS_AVERAGE_CELL:
            height = HEIGHT_STATS_AVERAGE_CELL
            case INDEX_STATS_BEST_CELL:
            height = HEIGHT_STATS_BEST_CELL
            case INDEX_STATS_TOTAL_CELL:
            height = HEIGHT_STATS_TOTAL_CELL
            default:
            height = HEIGHT_HISTORY_CELL
        }
            
        return height
            
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as NSManagedObject
        cell.textLabel.text = object.valueForKey("day").description
    }

    // #pragma mark - Fetched results controller

    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest = NSFetchRequest()
        // Edit the entity name as appropriate.
        let entity = NSEntityDescription.entityForName("StepDay", inManagedObjectContext: self.managedObjectContext)
        fetchRequest.entity = entity
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "day", ascending: false)
        let sortDescriptors = [sortDescriptor]
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
    	var error: NSError? = nil
    	if !_fetchedResultsController!.performFetch(&error) {
    	     // Replace this implementation with code to handle the error appropriately.
    	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             //println("Unresolved error \(error), \(error.userInfo)")
    	     abort()
    	}
        
        return _fetchedResultsController!
    }
    
    var _fetchedResultsController: NSFetchedResultsController? = nil

    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }



    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.endUpdates()
    }

    
    func scroll() {
        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 5, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
    }
    

}

