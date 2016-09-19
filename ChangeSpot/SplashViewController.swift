//
//  SplashViewController.swift
//  ChangeSpot
//
//  Created by Peter Su on 19/09/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

import UIKit

class SplashViewController: BaseViewController {

    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let pageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
    let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainNav") as! UINavigationController
    let gamesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GamesNav") as! UINavigationController
    let friendsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FriendsNav") as! UINavigationController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.purpleColor()
        
        self.pageViewController.dataSource = self
        self.pageViewController.setViewControllers(self.instantiateViewController(), direction: .Forward, animated: false, completion: nil)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        self.pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints([
            NSLayoutConstraint(item: self.view, attribute: .Top, relatedBy: .Equal, toItem: self.pageViewController.view, attribute: .Top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.view, attribute: .Bottom, relatedBy: .Equal, toItem: self.pageViewController.view, attribute: .Bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.view, attribute: .Leading, relatedBy: .Equal, toItem: self.pageViewController.view, attribute: .Leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.view, attribute: .Trailing, relatedBy: .Equal, toItem: self.pageViewController.view, attribute: .Trailing, multiplier: 1.0, constant: 0),
            ])
    }
    
    func instantiateViewController() -> [UIViewController] {
        
        var baseViewControllers = [UIViewController]()
        
        baseViewControllers.append(self.mainViewController)
        
        return baseViewControllers
    }
}

extension SplashViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController == self.gamesViewController {
            return nil
        }
        
        if viewController == self.mainViewController {
            return self.gamesViewController
        }
        
        return self.mainViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if viewController == self.friendsViewController {
            return nil
        }
        
        if viewController == self.mainViewController {
            return self.friendsViewController
        }
        
        return self.mainViewController
    }
    
}
