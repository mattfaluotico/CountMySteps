//
//  NavigationViewController.swift
//  MySteps
//
//  Created by Matthew Faluotico on 7/6/14.
//  Copyright (c) 2014 Matthew Faluotico. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder);

        
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        
        
        if (true) {
//            var validate: UIViewController = self.storyboard.instantiateViewControllerWithIdentifier("validate") as UIViewController
//            self.pushViewController(validate, animated: true)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}
