//
//  TimelineTableViewController.swift
//  CFG
//
//  Created by Brandon Shimiaie on 9/29/17.
//  Copyright © 2017 Ajeet Seenivasan. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {

    let dataArray = ["1", "2", "3", "4", "5"]
    let Journeys = ["Hiking", "Woodwork", "Banking"]
    
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
        return dataArray.count
    }
    //yo
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: <#T##NSIndexPath#>)
        cell.imageView?.image = UIImage(named: Journeys[indexPath.row] + ".jpg")
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    
}
