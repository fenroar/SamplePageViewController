//
//  BaseViewController.swift
//  ChangeSpot
//
//  Created by Peter Su on 19/09/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateNavigationBarHidden()
        self.updateStatusBarColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateNavigationBarHidden()
        self.updateStatusBarColor()
    }
    
    func preferredStatusBarIsWhite() -> Bool {
        return false
    }
    
    func preferredNavigationBarIsHidden() -> Bool {
        return true
    }
    
    private func updateNavigationBarHidden() {
        
        if let navController = self.navigationController {
            let currentNavBarIsHidden = navController.navigationBarHidden
            let expectedNavBarIsHidden = self.preferredNavigationBarIsHidden()
            
            if currentNavBarIsHidden != expectedNavBarIsHidden {
                if expectedNavBarIsHidden {
                    navController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
                    navController.navigationBar.shadowImage = UIImage()
                    navController.navigationBar.translucent = true
                } else {
                    navController.navigationBar.setBackgroundImage(nil, forBarMetrics: .Default)
                    navController.navigationBar.shadowImage = nil
                    navController.navigationBar.translucent = false
                }
            }
        }
    }

    private func updateStatusBarColor() {

        let currentStatusBarStyle = UIApplication.sharedApplication().statusBarStyle
        
        var expectedStatusBarstyle: UIStatusBarStyle
        if self.preferredStatusBarIsWhite() {
            expectedStatusBarstyle = .LightContent
        } else {
            expectedStatusBarstyle = .Default
        }
        
        if currentStatusBarStyle != expectedStatusBarstyle {
            UIApplication.sharedApplication().setStatusBarStyle(expectedStatusBarstyle, animated: true)
        }
    }
}

