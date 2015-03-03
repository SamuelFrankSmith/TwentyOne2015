//
//  RoundSchedule.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/15/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//


import UIKit
import Foundation

class RoundSchedule: UIViewController{
    
    @IBOutlet weak var whatRoundLbl: UILabel!
    
    @IBOutlet weak var game1Btn: UIButton!
    
    @IBOutlet weak var game2Btn: UIButton!
    
    @IBOutlet weak var game3Btn: UIButton!
    
    @IBOutlet weak var game4Btn: UIButton!
    
    @IBOutlet weak var game5Btn: UIButton!
    
    @IBOutlet weak var game6Btn: UIButton!
    
    @IBOutlet weak var game7Btn: UIButton!
    
    @IBOutlet weak var game8Btn: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var roundPicked: Int = 0
    
    var roundSchedule: [Int] = []
    
    var gamesPlayed = 0
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        roundSchedule = getRoundSchedule(roundPicked)
        whatRoundLbl.text = "Round \(roundPicked)"
        
        var game1Txt = "\(getTeamNameFromNumber(roundSchedule[0])) vs. \(getTeamNameFromNumber(roundSchedule[1]))"
        
        var game2Txt = "\(getTeamNameFromNumber(roundSchedule[2])) vs. \(getTeamNameFromNumber(roundSchedule[3]))"
        
        var game3Txt = "\(getTeamNameFromNumber(roundSchedule[4])) vs. \(getTeamNameFromNumber(roundSchedule[5]))"
        
        var game4Txt = "\(getTeamNameFromNumber(roundSchedule[6])) vs. \(getTeamNameFromNumber(roundSchedule[7]))"
        
        var game5Txt = "\(getTeamNameFromNumber(roundSchedule[8])) vs. \(getTeamNameFromNumber(roundSchedule[9]))"
        
        var game6Txt = "\(getTeamNameFromNumber(roundSchedule[10])) vs. \(getTeamNameFromNumber(roundSchedule[11]))"
        
        var game7Txt = "\(getTeamNameFromNumber(roundSchedule[12])) vs. \(getTeamNameFromNumber(roundSchedule[13]))"
        
        var game8Txt = "\(getTeamNameFromNumber(roundSchedule[14])) vs. \(getTeamNameFromNumber(roundSchedule[15]))"
        
        game1Btn.setTitle(game1Txt, forState: .Normal)
        game2Btn.setTitle(game2Txt, forState: .Normal)
        game3Btn.setTitle(game3Txt, forState: .Normal)
        game4Btn.setTitle(game4Txt, forState: .Normal)
        game5Btn.setTitle(game5Txt, forState: .Normal)
        game6Btn.setTitle(game6Txt, forState: .Normal)
        game7Btn.setTitle(game7Txt, forState: .Normal)
        game8Btn.setTitle(game8Txt, forState: .Normal)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "game1"
        {
            if let destinationVC = segue.destinationViewController as? GameScreen{
                destinationVC.roundNumber = roundPicked
                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[0])
                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[1])
                destinationVC.teamOneNumber = roundSchedule[0]
                destinationVC.teamTwoNumber = roundSchedule[1]
            }
        }
        
        if segue.identifier == "game2"
        {
            if let destinationVC = segue.destinationViewController as? GameScreen{
                destinationVC.roundNumber = roundPicked
                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[2])
                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[3])
                destinationVC.teamOneNumber = roundSchedule[2]
                destinationVC.teamTwoNumber = roundSchedule[3]
            }
        }
        
        if segue.identifier == "game3"
        {
            if let destinationVC = segue.destinationViewController as? GameScreen{
                destinationVC.roundNumber = roundPicked
                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[4])
                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[5])
                destinationVC.teamOneNumber = roundSchedule[4]
                destinationVC.teamTwoNumber = roundSchedule[5]
            }
        }
        
        if segue.identifier == "game4"
        {
            if let destinationVC = segue.destinationViewController as? GameScreen{
                destinationVC.roundNumber = roundPicked
                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[6])
                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[7])
                destinationVC.teamOneNumber = roundSchedule[6]
                destinationVC.teamTwoNumber = roundSchedule[7]
            }
        }
        
        if segue.identifier == "game5"
        {
            if let destinationVC = segue.destinationViewController as? GameScreen{
                destinationVC.roundNumber = roundPicked
                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[8])
                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[9])
                destinationVC.teamOneNumber = roundSchedule[8]
                destinationVC.teamTwoNumber = roundSchedule[9]
            }
        }
        
        if segue.identifier == "game6"
        {
            if let destinationVC = segue.destinationViewController as? GameScreen{
                destinationVC.roundNumber = roundPicked
                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[10])
                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[11])
                destinationVC.teamOneNumber = roundSchedule[10]
                destinationVC.teamTwoNumber = roundSchedule[11]
            }
        }
        
        if segue.identifier == "game7"
        {
            if let destinationVC = segue.destinationViewController as? GameScreen{
                destinationVC.roundNumber = roundPicked
                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[12])
                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[13])
                destinationVC.teamOneNumber = roundSchedule[12]
                destinationVC.teamTwoNumber = roundSchedule[13]
            }
        }
        
        if segue.identifier == "game8"
        {
            if let destinationVC = segue.destinationViewController as? GameScreen{
                destinationVC.roundNumber = roundPicked
                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[14])
                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[15])
                destinationVC.teamOneNumber = roundSchedule[14]
                destinationVC.teamTwoNumber = roundSchedule[15]
            }
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        activityIndicator.startAnimating()
        var count = 0
        gamesPlayed = 0
        
        for var i = 0; i < 15; i += 2 {
            
            var team1Played = 0
            var team2Played = 0
            
            var query = PFQuery(className: "Team")
            var team1 = query.getObjectWithId(getTeamId(roundSchedule[i]))
            var team1Array: [Int] = team1["recordArray"] as Array
            
            var query2 = PFQuery(className: "Team")
            var team2 = query2.getObjectWithId(getTeamId(roundSchedule[i+1]))
            var team2Array: [Int] = team2["recordArray"] as Array
            
            if team1Array[roundPicked-1] != 0{
                team1Played = 1
            }
            if team2Array[roundPicked-1] != 0{
                team2Played = 1
            }
            
            if team1Played == 1 && team2Played == 1{
                gamesPlayed++
            }else{
                break
            }
            
        }
        
        if gamesPlayed >= 1{
            game1Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        if gamesPlayed >= 2{
            game2Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        if gamesPlayed >= 3{
            game3Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        if gamesPlayed >= 4{
            game4Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        if gamesPlayed >= 5{
            game5Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        if gamesPlayed >= 6{
            game6Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        if gamesPlayed >= 7{
            game7Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        if gamesPlayed >= 8{
            game8Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        }
        
        activityIndicator.stopAnimating()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
}