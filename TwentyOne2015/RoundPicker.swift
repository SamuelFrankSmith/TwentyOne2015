//
//  RoundPicker.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/12/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import UIKit
import Foundation

class RoundSelector: UIViewController{
    
    var furthestCompletedRound = 0
    
    @IBOutlet weak var round1Btn: UIButton!
    
    @IBOutlet weak var round2Btn: UIButton!
    
    @IBOutlet weak var round3Btn: UIButton!
    
    @IBOutlet weak var round4Btn: UIButton!
    
    @IBOutlet weak var round5Btn: UIButton!
    
    @IBOutlet weak var round6Btn: UIButton!
    
    @IBOutlet weak var round7Btn: UIButton!
    
    @IBOutlet weak var round8Btn: UIButton!
    
    @IBOutlet weak var round9Btn: UIButton!
    
    @IBOutlet weak var round10Btn: UIButton!
    
    @IBOutlet weak var playoffsBtn: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "round1"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 1
            }
        }
        
        if segue.identifier == "round2"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 2
            }
        }
        
        if segue.identifier == "round3"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 3
            }
        }
        
        if segue.identifier == "round4"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 4
            }
        }
        
        if segue.identifier == "round5"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 5
            }
        }
        
        if segue.identifier == "round6"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 6
            }
        }
        
        if segue.identifier == "round7"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 7
            }
        }
        
        if segue.identifier == "round8"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 8
            }
        }
        
        if segue.identifier == "round9"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 9
            }
        }
        
        if segue.identifier == "round10"
        {
            if let destinationVC = segue.destinationViewController as? RoundSchedule{
                destinationVC.roundPicked = 10
            }
        }
        
        if segue.identifier == "PORoundOne"
        {
            if let destinationVC = segue.destinationViewController as? PlayoffsRoundOne{
            }
        }
    }
    
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        furthestCompletedRound = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        
    
        var numOfTeamsCompleted = 0
        var roundNotCompleted = 0
        
        
        for i in 0...15{
            var gamesCompleted = 0
            var teamId = getTeamId(i+1)
            var query = PFQuery(className: "Team")
            var teamResults = query.getObjectWithId(teamId)
            
            var results: [Int] = teamResults["recordArray"] as Array
            
            for i in 0...9{
                if results [i] == 0{
                        break
                    }else{
                        gamesCompleted++
                    
                    }
            }
            
            if gamesCompleted > furthestCompletedRound {
                furthestCompletedRound = gamesCompleted
                numOfTeamsCompleted = 1
            } else if gamesCompleted == furthestCompletedRound{
                numOfTeamsCompleted++
            } else {
                furthestCompletedRound = gamesCompleted
                roundNotCompleted = 1
            }
            
            if roundNotCompleted == 1{
                furthestCompletedRound = furthestCompletedRound - 1
                break
            }
        }
        
        println("Completed Rounds: \(furthestCompletedRound)")
        
        if furthestCompletedRound >= 1{
            round1Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 2{
            round2Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 3{
            round3Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 4{
            round4Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 5{
            round5Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 6{
            round6Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 7{
            round7Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 8{
            round8Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 9{
            round9Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
        if furthestCompletedRound >= 10{
            round10Btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
//            playoffsBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        }
        
        activityIndicator.stopAnimating()
        
    
    }
    
    
}