//
//  TimelineTableViewController.swift
//  CFG
//
//  Created by Brandon Shimiaie on 9/29/17.
//  Copyright © 2017 Ajeet Seenivasan. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: <#T##NSIndexPath#>)
        cell.textLabel?.text = "Test"
    }
    
}
