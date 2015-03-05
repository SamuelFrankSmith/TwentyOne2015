//
//  TeamList.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/23/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import Foundation
import UIKit

class TeamList: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var teamTableView: UITableView!
    
    var nameList = ["Salisbury State", "Purdue", "Morehead", "Illinois", "Duke", "America University", "Phoenix", "Grown Ass Man U", "SMU", "Indiana", "Lincoln Land", "Iowa", "Asheville", "Kirkwood CC", "UTI", "Oregon State"]
    
    var teamPicked = ""
    var displayName = ""
    var parseName = ""
    var teamNum = 0
    
    
    override func viewDidLoad() {
        
        self.teamTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.teamTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
//        cell.textLabel?.textColor = UIColor.whiteColor()
//        cell.backgroundColor? = UIColor.redColor()
        cell.textLabel?.text = nameList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected row \(indexPath.row)")
        if indexPath.row == 0{
            teamPicked = nameList[0]
            displayName = "Salisbury State"
            parseName = "Salisbury State"
            teamNum = 1
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 1{
            teamPicked = nameList[1]
            displayName = "Purdue"
            parseName = "Purdue"
            teamNum = 2
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 2{
            teamPicked = nameList[2]
            displayName = "Morehead State"
            parseName = "Morehead"
            teamNum = 3
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 3{
            teamPicked = nameList[3]
            displayName = "Illinois"
            parseName = "Illinois"
            teamNum = 4
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 4{
            teamPicked = nameList[4]
            displayName = "Duke"
            parseName = "Duke"
            teamNum = 5
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 5{
            teamPicked = nameList[5]
            displayName = "America University"
            parseName = "American"
            teamNum = 6
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 6{
            teamPicked = nameList[6]
            displayName = "Phoenix"
            parseName = "Phoenix"
            teamNum = 7
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 7{
            teamPicked = nameList[7]
            displayName = "Grown Ass Man U"
            parseName = "Grown Ass Man"
            teamNum = 8
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 8{
            teamPicked = nameList[8]
            displayName = "SMU"
            parseName = "SMU"
            teamNum = 9
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 9{
            teamPicked = nameList[9]
            displayName = "Indiana"
            parseName = "Indiana"
            teamNum = 10
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 10{
            teamPicked = nameList[10]
            displayName = "Lincoln Land"
            parseName = "Lincoln Land"
            teamNum = 11
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 11{
            teamPicked = nameList[11]
            displayName = "University of Iowa"
            parseName = "Iowa"
            teamNum = 12
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 12{
            teamPicked = nameList[12]
            displayName = "Asheville"
            parseName = "Asheville"
            teamNum = 13
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 13{
            teamPicked = nameList[13]
            displayName = "Kirkwood CC"
            parseName = "Kirkwood CC"
            teamNum = 14
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 14{
            teamPicked = nameList[14]
            displayName = "Universal Technical Institute"
            parseName = "UTI"
            teamNum = 15
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        if indexPath.row == 15{
            teamPicked = nameList[15]
            displayName = "Oregon State"
            parseName = "Oregon State"
            teamNum = 16
            performSegueWithIdentifier("teamDataSegue", sender: self)
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "teamDataSegue"
        {
            if let destinationVC = segue.destinationViewController as? TeamData{
                destinationVC.team = parseName
                destinationVC.teamDisplayName = displayName
                destinationVC.teamNum = teamNum
            }
        }
    }
    
}