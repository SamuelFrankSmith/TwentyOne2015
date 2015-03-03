//
//  PlayoffsRoundOne.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/17/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import UIKit
import Foundation

class PlayoffsRoundOne: UIViewController {
    
//    @IBOutlet weak var game1Btn: UIButton!
//    
//    @IBOutlet weak var game2Btn: UIButton!
//    
//    @IBOutlet weak var game3Btn: UIButton!
//    
//    @IBOutlet weak var game4Btn: UIButton!
//    
//    @IBOutlet weak var game5Btn: UIButton!
//    
//    @IBOutlet weak var game6Btn: UIButton!
//    
//    @IBOutlet weak var game7Btn: UIButton!
//    
//    @IBOutlet weak var game8Btn: UIButton!
//    
//    var rankingsArray: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
//    var recordArray: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
//    
//    
//    
//    var roundPicked: Int = 0
//    
//    var roundSchedule: [Int] = []
    
//    override func viewDidLoad() {
    
//        var game1Txt = "\(rankingsArray[0]) vs. \(rankingsArray[15])"
//        
//        var game2Txt = "\(rankingsArray[7]) vs. \(rankingsArray[8])"
//        
//        var game3Txt = "\(rankingsArray[3]) vs. \(rankingsArray[12])"
//        
//        var game4Txt = "\(rankingsArray[4]) vs. \(rankingsArray[11])"
//        
//        var game5Txt = "\(rankingsArray[1]) vs. \(rankingsArray[14])"
//        
//        var game6Txt = "\(rankingsArray[6]) vs. \(rankingsArray[9])"
//        
//        var game7Txt = "\(rankingsArray[2]) vs. \(rankingsArray[13])"
//        
//        var game8Txt = "\(rankingsArray[5]) vs. \(rankingsArray[10])"
//        
//        game1Btn.setTitle(game1Txt, forState: .Normal)
//        game2Btn.setTitle(game2Txt, forState: .Normal)
//        game3Btn.setTitle(game3Txt, forState: .Normal)
//        game4Btn.setTitle(game4Txt, forState: .Normal)
//        game5Btn.setTitle(game5Txt, forState: .Normal)
//        game6Btn.setTitle(game6Txt, forState: .Normal)
//        game7Btn.setTitle(game7Txt, forState: .Normal)
//        game8Btn.setTitle(game8Txt, forState: .Normal)
//        
//    }
//    
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "game1"
//        {
//            if let destinationVC = segue.destinationViewController as? GameScreen{
//                destinationVC.roundNumber = roundPicked
//                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[0])
//                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[1])
//                destinationVC.teamOneNumber = roundSchedule[0]
//                destinationVC.teamTwoNumber = roundSchedule[1]
//            }
//        }
//        
//        if segue.identifier == "game2"
//        {
//            if let destinationVC = segue.destinationViewController as? GameScreen{
//                destinationVC.roundNumber = roundPicked
//                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[2])
//                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[3])
//                destinationVC.teamOneNumber = roundSchedule[2]
//                destinationVC.teamTwoNumber = roundSchedule[3]
//            }
//        }
//        
//        if segue.identifier == "game3"
//        {
//            if let destinationVC = segue.destinationViewController as? GameScreen{
//                destinationVC.roundNumber = roundPicked
//                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[4])
//                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[5])
//                destinationVC.teamOneNumber = roundSchedule[4]
//                destinationVC.teamTwoNumber = roundSchedule[5]
//            }
//        }
//        
//        if segue.identifier == "game4"
//        {
//            if let destinationVC = segue.destinationViewController as? GameScreen{
//                destinationVC.roundNumber = roundPicked
//                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[6])
//                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[7])
//                destinationVC.teamOneNumber = roundSchedule[6]
//                destinationVC.teamTwoNumber = roundSchedule[7]
//            }
//        }
//        
//        if segue.identifier == "game5"
//        {
//            if let destinationVC = segue.destinationViewController as? GameScreen{
//                destinationVC.roundNumber = roundPicked
//                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[8])
//                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[9])
//                destinationVC.teamOneNumber = roundSchedule[8]
//                destinationVC.teamTwoNumber = roundSchedule[9]
//            }
//        }
//        
//        if segue.identifier == "game6"
//        {
//            if let destinationVC = segue.destinationViewController as? GameScreen{
//                destinationVC.roundNumber = roundPicked
//                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[10])
//                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[11])
//                destinationVC.teamOneNumber = roundSchedule[10]
//                destinationVC.teamTwoNumber = roundSchedule[11]
//            }
//        }
//        
//        if segue.identifier == "game7"
//        {
//            if let destinationVC = segue.destinationViewController as? GameScreen{
//                destinationVC.roundNumber = roundPicked
//                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[12])
//                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[13])
//                destinationVC.teamOneNumber = roundSchedule[12]
//                destinationVC.teamTwoNumber = roundSchedule[13]
//            }
//        }
//        
//        if segue.identifier == "game8"
//        {
//            if let destinationVC = segue.destinationViewController as? GameScreen{
//                destinationVC.roundNumber = roundPicked
//                destinationVC.teamOneName = getTeamNameFromNumber(roundSchedule[14])
//                destinationVC.teamTwoName = getTeamNameFromNumber(roundSchedule[15])
//                destinationVC.teamOneNumber = roundSchedule[14]
//                destinationVC.teamTwoNumber = roundSchedule[15]
//            }
//        }
//        
//    }
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        //Code to get rankings and generate playoff schedule
//        getCurrentStats()
//        
//        
//        for i in 1...16{
//            
//            var query = PFQuery(className: "Team")
//            query.whereKey("rank", equalTo: i)
//            var object = query.getFirstObject()
//            
//            var teamName = object["teamName"] as String!
//            var teamWins = object["wins"] as Int!
//            var teamLosses = object ["losses"] as Int!
//            var teamCD = object ["CD"] as Int!
//            var teamCDWithCharacter: String = ""
//            if teamCD >= 0{
//                teamCDWithCharacter = "+\(teamCD)"
//            } else {
//                teamCDWithCharacter = "\(teamCD)"
//            }
//            var teamRecord = "(\(teamWins) - \(teamLosses))  \(teamCDWithCharacter)"
//            
//            self.recordArray[i-1] = teamRecord
//            self.rankingsArray[i-1] = teamName
//            
//        }
//        
//        
//    }
//    
//    func getCurrentStats(){
//        
//        var winArray: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
//        var updateTeam: [String] = []
//        
//        //Get wins list
//        var winsQuery = PFQuery(className: "Team")
//        winsQuery.orderByDescending("wins")
//        var wins: [AnyObject]! = winsQuery.findObjects()
//        
//        //        //Get CD list
//        
//        
//        //Place the current wins into an array
//        for i in 0...15{
//            var teamWins = wins[i]["wins"] as Int!
//            winArray[i] = teamWins
//        }
//        
//        //Sort by wins and CD
//        
//        //What are the different amount of win totals?
//        var winTotalArray: [Int] = []
//        winTotalArray.append(winArray[0])
//        for i in 1...15{
//            var winsOfNextTeam = winArray[i]
//            if winsOfNextTeam != winArray[i-1]{
//                winTotalArray.append(winsOfNextTeam)
//            }
//            
//        }
//        
//        if winTotalArray.count != 1{
//            //Sort win totals by CD
//            var cdQuery = PFQuery(className: "Team")
//            
//            for i in 0...(winTotalArray.count - 1) {
//                cdQuery.whereKey("wins", equalTo: winTotalArray[i])
//                cdQuery.orderByDescending("CD")
//                var order: [AnyObject]! = cdQuery.findObjects()
//                
//                for i in 0...order.count-1{
//                    var name: String
//                    name = order[i]["teamName"] as String!
//                    updateTeam.append(name)
//                }
//            }
//            
//            for i in 0...15{
//                self.updateRankings(updateTeam[i], rank: i+1)
//            }
//        }
//    }
//    
//    
//    func updateRankings(teamname: String, rank: Int){
//        var query = PFQuery(className: "Team")
//        query.whereKey("teamName", equalTo: teamname)
//        var object = query.getFirstObject()
//        
//        println("\(teamname): \(rank)")
//        
//        object["teamName"] = teamname
//        object["rank"] = rank
//        object.save()
//    }
//    }
}