//
//  BaseViewController.swift
//  ChangeSpot
//
//  Created by Peter Su on 19/09/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.updateStatusBarColor()
    }
    
    func preferredStatusBarIsWhite() -> Bool {
        return false
    }
    
    func preferredStatusBarIsHidden() -> Bool {
        return false
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

