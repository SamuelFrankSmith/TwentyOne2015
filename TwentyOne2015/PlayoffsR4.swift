//
//  PlayoffsR4.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 3/2/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import Foundation
import UIKit

class PlayoffsR4: UIViewController {
    
    var r2PlayoffRecord: [Int] = []
    var r3PlayoffRecord: [Int] = []
    var teamRankArray: [String] = []
    var teamsLeftArray: [String] = []
    var teamLeftRankArray: [Int] = []
    
    var team1 = ""
    var team2 = ""
    
    var admin = false
    


    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var team1Btn: UIButton!
    @IBOutlet weak var team2Btn: UIButton!
    
    
    @IBAction func team1BtnTap(sender: AnyObject) {
        if admin == true{
            team2Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team1Btn.selected = true
            team2Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: team1)
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[3] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: team2)
            var teamTwo = query2.getFirstObject()
            var playoffRecord3: [Int] = teamTwo["PlayoffArray"] as Array!
            
            playoffRecord3[3] = 0
            
            teamTwo["PlayoffArray"] = playoffRecord3
            
            teamTwo.save()
        }

    }
    
    @IBAction func team2BtnTap(sender: AnyObject) {
        if admin == true{
            team1Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team2Btn.selected = true
            team1Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: team1)
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[3] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: team2)
            var teamTwo = query2.getFirstObject()
            var playoffRecord3: [Int] = teamTwo["PlayoffArray"] as Array!
            
            playoffRecord3[3] = 0
            
            teamTwo["PlayoffArray"] = playoffRecord3
            
            teamTwo.save()
        }

    }

    
    
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        team1Btn.setTitle("", forState: .Normal)
        team2Btn.setTitle("", forState: .Normal)
    }
    
    override func viewDidAppear(animated: Bool) {
        //Get playoff records and set matchups
        
        for i in 0...15{
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: teamRankArray[i])
            var team = query.getFirstObject()
            
            var playoffRec: [Int] = team["PlayoffArray"] as Array!
            
            if playoffRec[2] == 1{
                teamsLeftArray.append(team["teamName"] as String!)
                teamLeftRankArray.append(team["rank"] as Int!)
            }
            r2PlayoffRecord.append(playoffRec[3])
            
        }
        
        team1Btn.setTitle("#\(teamLeftRankArray[0]) \(teamsLeftArray[0])", forState: .Normal)
        team2Btn.setTitle("#\(teamLeftRankArray[1]) \(teamsLeftArray[1])", forState: .Normal)

        
        team1 = teamsLeftArray[0]
        team2 = teamsLeftArray[1]
        
        
        for i in 0...1{
            var secondRoundQuery = PFQuery(className: "Team")
            secondRoundQuery.whereKey("teamName", equalTo: teamsLeftArray[i])
            var team = secondRoundQuery.getFirstObject()
            var r3PlayoffRec: [Int] = team["PlayoffArray"] as Array!
            r3PlayoffRecord.append(r3PlayoffRec[3])
        }
        
        
        if r3PlayoffRecord[0] == 1{
            team2Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team1Btn.selected = true
            team2Btn.selected = false
        }else if r3PlayoffRecord[1] == 1{
            team1Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team2Btn.selected = true
            team1Btn.selected = false

        
        activityIndicator.stopAnimating()
        
    }
    
    }
}
