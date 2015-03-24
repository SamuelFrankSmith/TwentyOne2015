//
//  PlayoffsR3.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 3/2/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import Foundation
import UIKit

class PlayoffsR3: UIViewController {
    
    var r2PlayoffRecord: [Int] = []
    var r3PlayoffRecord: [Int] = []
    var teamRankArray: [String] = []
    var teamNameArray: [String] = ["","","",""]
    var teamsLeftArray: [String] = []
    var teamLeftRankArray: [Int] = []
    
    var team1 = ""
    var team2 = ""
    var team3 = ""
    var team4 = ""
    
    var admin = false

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var team1Btn: UIButton!
    @IBOutlet weak var team2Btn: UIButton!
    @IBOutlet weak var team3Btn: UIButton!
    @IBOutlet weak var team4Btn: UIButton!
    
    @IBAction func team1BtnTap(sender: AnyObject) {
        if admin == true{
            team2Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team1Btn.selected = true
            team2Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: team1)
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[2] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: team2)
            var teamTwo = query2.getFirstObject()
            var playoffRecord3: [Int] = teamTwo["PlayoffArray"] as Array!
            
            playoffRecord3[2] = 0
            
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
            query.whereKey("teamName", equalTo: team2)
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[2] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: team1)
            var teamTwo = query2.getFirstObject()
            var playoffRecord3: [Int] = teamTwo["PlayoffArray"] as Array!
            
            playoffRecord3[2] = 0
            
            teamTwo["PlayoffArray"] = playoffRecord3
            
            teamTwo.save()
        }
    }
    
    @IBAction func team3BtnTap(sender: AnyObject) {
        if admin == true{
            team4Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team3Btn.selected = true
            team4Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: team3)
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[2] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: team4)
            var teamTwo = query2.getFirstObject()
            var playoffRecord3: [Int] = teamTwo["PlayoffArray"] as Array!
            
            playoffRecord3[2] = 0
            
            teamTwo["PlayoffArray"] = playoffRecord3
            
            teamTwo.save()
        }

    }
    

    @IBAction func team4BtnTap(sender: AnyObject) {
        if admin == true{
            team3Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team4Btn.selected = true
            team3Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: team4)
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[2] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: team3)
            var teamTwo = query2.getFirstObject()
            var playoffRecord3: [Int] = teamTwo["PlayoffArray"] as Array!
            
            playoffRecord3[2] = 0
            
            teamTwo["PlayoffArray"] = playoffRecord3
            
            teamTwo.save()
        }
    }
    
    
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        team1Btn.setTitle("", forState: .Normal)
        team2Btn.setTitle("", forState: .Normal)
        team3Btn.setTitle("", forState: .Normal)
        team4Btn.setTitle("", forState: .Normal)
    }
    
    override func viewDidAppear(animated: Bool) {
        //Get playoff records and set matchups
        
        for i in 0...15{
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: teamRankArray[i])
            var team = query.getFirstObject()
            
            var playoffRec: [Int] = team["PlayoffArray"] as Array!
            
            if playoffRec[1] == 1{
                teamsLeftArray.append(team["teamName"] as String!)
                teamLeftRankArray.append(team["rank"] as Int!)
            }
            r2PlayoffRecord.append(playoffRec[2])
            
        }
        
        team1Btn.setTitle("#\(teamLeftRankArray[0]) \(teamsLeftArray[0])", forState: .Normal)
        team2Btn.setTitle("#\(teamLeftRankArray[3]) \(teamsLeftArray[3])", forState: .Normal)
        team3Btn.setTitle("#\(teamLeftRankArray[1]) \(teamsLeftArray[1])", forState: .Normal)
        team4Btn.setTitle("#\(teamLeftRankArray[2]) \(teamsLeftArray[2])", forState: .Normal)
        
        team1 = teamsLeftArray[0]
        team2 = teamsLeftArray[3]
        team3 = teamsLeftArray[1]
        team4 = teamsLeftArray[2]
        
//        if r2PlayoffRecord[0] == 1 {
//            team1Btn.setTitle("#1 \(teamRankArray[0])", forState: .Normal)
//            team1 = teamRankArray[0]
//            teamNameArray[0] = teamRankArray[0]
//        }else{
//            team1Btn.setTitle("#16 \(teamRankArray[15])", forState: .Normal)
//            team1 = teamRankArray[15]
//            teamNameArray[0] = teamRankArray[15]
//        }
//        if r2PlayoffRecord[7] == 1 {
//            team2Btn.setTitle("#8 \(teamRankArray[7])", forState: .Normal)
//            team2 = teamRankArray[7]
//            teamNameArray[1] = teamRankArray[7]
//        }else{
//            team2Btn.setTitle("#9 \(teamRankArray[8])", forState: .Normal)
//            team2 = teamRankArray[8]
//            teamNameArray[1] = teamRankArray[8]
//        }
//        if r2PlayoffRecord[3] == 1 {
//            team3Btn.setTitle("#4 \(teamRankArray[3])", forState: .Normal)
//            team3 = teamRankArray[3]
//            teamNameArray[2] = teamRankArray[3]
//        }else{
//            team3Btn.setTitle("#13 \(teamRankArray[12])", forState: .Normal)
//            team3 = teamRankArray[12]
//            teamNameArray[2] = teamRankArray[3]
//        }
//        if r2PlayoffRecord[4] == 1 {
//            team4Btn.setTitle("#5 \(teamRankArray[4])", forState: .Normal)
//            team4 = teamRankArray[4]
//            teamNameArray[3] = teamRankArray[4]
//        }else{
//            team4Btn.setTitle("#12 \(teamRankArray[11])", forState: .Normal)
//            team4 = teamRankArray[11]
//            teamNameArray[3] = teamRankArray[11]
//        }
        
        
        for i in 0...3{
            var secondRoundQuery = PFQuery(className: "Team")
            secondRoundQuery.whereKey("teamName", equalTo: teamsLeftArray[i])
            var team = secondRoundQuery.getFirstObject()
            var r3PlayoffRec: [Int] = team["PlayoffArray"] as Array!
            r3PlayoffRecord.append(r3PlayoffRec[2])
        }
        
        
        if r3PlayoffRecord[0] == 1{
            team2Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team1Btn.selected = true
            team2Btn.selected = false
        }else if r3PlayoffRecord[3] == 1{
            team1Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team2Btn.selected = true
            team1Btn.selected = false
        }
        if r3PlayoffRecord[1] == 1{
            team4Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team3Btn.selected = true
            team4Btn.selected = false
        }else if r3PlayoffRecord[2] == 1{
            team3Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            team4Btn.selected = true
            team3Btn.selected = false
        }
        
        activityIndicator.stopAnimating()
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToR4"
        {
            if let destinationVC = segue.destinationViewController as? PlayoffsR4{
                destinationVC.teamRankArray = teamRankArray
                destinationVC.admin = admin
            }
        }
        
    }
}