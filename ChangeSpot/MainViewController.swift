//
//  MainViewController.swift
//  ChangeSpot
//
//  Created by Peter Su on 19/09/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

import UIKit

// Main View Controller has a transparent navigation bar and white status bar

class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
    }
    
    override func preferredNavigationBarIsHidden() -> Bool {
        return true
    }
    
    override func preferredStatusBarIsWhite() -> Bool {
        return true
    }
    
    override func preferredBackButtonStyle() -> BackButtonStyle {
        return .Yellow
    }
}
