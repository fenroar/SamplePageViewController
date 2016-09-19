//
//  FriendListViewController.swift
//  ChangeSpot
//
//  Created by Peter Su on 19/09/2016.
//  Copyright © 2016 fenroar. All rights reserved.
//

import UIKit

class FriendListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func preferredBackButtonStyle() -> BackButtonStyle {
        return .Yellow
    }

}

extension FriendListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as? UITableViewCell {
            cell.textLabel?.text = "Cell \(indexPath.row + 1)"
            return cell
        }
        
        return UITableViewCell()
    }
}