//
//  BaseViewController.swift
//  ChangeSpot
//
//  Created by Peter Su on 19/09/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

import UIKit

enum BackButtonStyle {
    case Black
    case White
    case Yellow
    case Blue
    case Green
}

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Hello"
        
        self.updateNavigationBarHidden()
        self.updateBackButtonImage()
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
    
    func preferredBackButtonStyle() -> BackButtonStyle {
        return .Black
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
    
    private func updateBackButtonImage() {
        
        if let navController = self.navigationController {
            var imagePath = ""
            switch self.preferredBackButtonStyle() {
            case .White:
                imagePath = "back_white"
            case .Black:
                imagePath = "back_purple"
            case .Blue:
                imagePath = "back_blue"
            case .Green:
                imagePath = "back_green"
            case .Yellow:
                imagePath = "back_yellow"
            }
            
            let backBtn = UIImage(named: imagePath)?.imageWithRenderingMode(.AlwaysOriginal)
            
            navController.navigationBar.backIndicatorImage = backBtn;
            navController.navigationBar.backIndicatorTransitionMaskImage = backBtn;
            
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
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

