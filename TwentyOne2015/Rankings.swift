//
//  Rankings.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/13/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import UIKit
import Foundation

class Rankings: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loadingLbl: UILabel!
    
    
    var rankingsArray: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    var recordArray: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    var rankingsString: String = ""
    var recordString: String = ""
    
    @IBOutlet weak var rankingsLbl: UILabel!
    
    @IBOutlet weak var recordLbl: UILabel!
    
    override func viewDidLoad() {
        rankingsLbl.text = ""
        recordLbl.text = ""
    }
    
    override func viewDidAppear(animated: Bool) {
        
        activityIndicator.startAnimating()
        
        getCurrentStats()
        
        
        for i in 1...16{
            
            var query = PFQuery(className: "Team")
            query.whereKey("rank", equalTo: i)
            var object = query.getFirstObject()
            
            var teamName = object["teamName"] as String!
            var teamWins = object["wins"] as Int!
            var teamLosses = object ["losses"] as Int!
            var teamCD = object ["CD"] as Int!
            var teamCDWithCharacter: String = ""
            if teamCD >= 0{
                teamCDWithCharacter = "+\(teamCD)"
            } else {
                teamCDWithCharacter = "\(teamCD)"
            }
            var teamRecord = "(\(teamWins) - \(teamLosses))  \(teamCDWithCharacter)"
            
            self.recordArray[i-1] = teamRecord
            self.rankingsArray[i-1] = teamName
            
        }
        
        for i in 0...15{
            rankingsString = rankingsString + "#\(i+1): \(rankingsArray[i])\n"
            recordString = recordString + "\(recordArray[i])\n"
        }
        
        rankingsLbl.numberOfLines = 0
        rankingsLbl.text = rankingsString
        recordLbl.numberOfLines = 0
        recordLbl.text = recordString
        
        loadingLbl.text = ""
        activityIndicator.stopAnimating()
}
    
    func getCurrentStats(){
        
        var winArray: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        var updateTeam: [String] = []
        
        //Get wins list
        var winsQuery = PFQuery(className: "Team")
        winsQuery.orderByDescending("wins")
        var wins: [AnyObject]! = winsQuery.findObjects()
        
        //        //Get CD list
        
        
        //Place the current wins into an array
        for i in 0...15{
            var teamWins = wins[i]["wins"] as Int!
            winArray[i] = teamWins
        }
        
        //Sort by wins and CD
        
        //What are the different amount of win totals?
        var winTotalArray: [Int] = []
        winTotalArray.append(winArray[0])
        for i in 1...15{
            var winsOfNextTeam = winArray[i]
            if winsOfNextTeam != winArray[i-1]{
                winTotalArray.append(winsOfNextTeam)
            }
            
        }
        
        if winTotalArray.count != 1{
            //Sort win totals by CD
            var cdQuery = PFQuery(className: "Team")
            
            for i in 0...(winTotalArray.count - 1) {
                cdQuery.whereKey("wins", equalTo: winTotalArray[i])
                cdQuery.orderByDescending("CD")
                var order: [AnyObject]! = cdQuery.findObjects()
                
                for i in 0...order.count-1{
                    var name: String
                    name = order[i]["teamName"] as String!
                    updateTeam.append(name)
                }
            }
            
            for i in 0...15{
                    self.updateRankings(updateTeam[i], rank: i+1)
            }
        }
    }
        
    
    func updateRankings(teamname: String, rank: Int){
        var query = PFQuery(className: "Team")
        query.whereKey("teamName", equalTo: teamname)
        var object = query.getFirstObject()
        
//                println("\(teamname): \(rank)")
        
                object["teamName"] = teamname
                object["rank"] = rank
                object.save()
        }
    }


    
//            var query = PFQuery(className: "Team")
//            query.whereKey("rank", equalTo: i)
//            query.getFirstObjectInBackgroundWithBlock {
//                (object: PFObject!, error: NSError!) -> Void in
//                if error == nil {
//                    
//                    var teamName = object["teamName"] as String!
//                    var teamWins = object["wins"] as Int!
//                    var teamLosses = object ["losses"] as Int!
//                    var teamRecord = "\(teamWins) - \(teamLosses)"
//                    
//                    self.recordArray[i-1] = teamRecord
//                    self.rankingsArray[i-1] = teamName
//                    
//                    
//                } else {
//                    NSLog("Request \(i) Failed")
//                }
//            }

