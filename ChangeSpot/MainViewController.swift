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
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    override func preferredStatusBarIsWhite() -> Bool {
        return true
    }
}
