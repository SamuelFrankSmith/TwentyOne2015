//
//  InitializeData.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/12/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import Foundation




func initializeData () {

    var teamRankList: [String] = ["L89EcuMeDz", "m77Ffi4iYk", "nSgUdbIWVa", "0a3QtCTyej", "5vSP2bXKdH", "ljCV4fz6Pw", "VoCdWZce2O", "P273Yw1lS6", "UBIDBRm48C", "9x8LWIRLgk", "ad1T70EBmD", "yrUnBoLGXH", "IFntLhNac2", "RvmHbDBsNx", "UqYi6HCyUe", "8vk6hSqQPj"]    
    
    for i in 0...15{
        var team = PFObject(className: "Team")
        var query = PFQuery(className: "Team")
        query.getObjectInBackgroundWithId(teamRankList[i]){
            (team: PFObject!, error: NSError!) -> Void in
            if error != nil{
                //Error scenario here
                NSLog("%@", error)
            } else {
                //What to do with your data
                team["rank"] = i+1
                team["wins"] = 0
                team["losses"] = 0
                team["CD"] = 0
                team["recordArray"] = [0,0,0,0,0,0,0,0,0,0]
                team["PlayoffArray"] = [0,0,0,0,0]
                team.save()
            }
        }
    }
    
}