//
//  TeamData.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/23/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import Foundation
import UIKit

class TeamData: UIViewController {
    
    var team = "Purdue"
    var teamDisplayName = ""
    var record: [Int] = []
    var season = ""
    var champs = 0
    var p1 = ""
    var p2 = ""
    var p3 = ""
    var teamNum = 0
    
    var recordString = ""
    var scheduleString = ""
    
    
    
    @IBOutlet weak var championshipLbl: UILabel!
    
    @IBOutlet weak var tourneyNumLbl: UILabel!
    
    @IBOutlet weak var teamNameLbl: UILabel!
    
    @IBOutlet weak var scheduleLbl: UILabel!
    
    @IBOutlet weak var resultLbl: UILabel!
    
    
    override func viewDidLoad() {
        teamNameLbl.text = teamDisplayName
        tourneyNumLbl.text = ""
        championshipLbl.text = ""
        scheduleLbl.text = ""
        resultLbl.text = ""
        
    }
    
    override func viewDidAppear(animated: Bool) {
        var query = PFQuery(className: "Team")
        query.whereKey("teamName", equalTo: team)
        var teamData = query.getFirstObject()
        
        record = teamData["recordArray"] as Array
        season = teamData["season"] as String
        champs = teamData["Champs"] as Int
        p1 = teamData["player1"] as String
        p2 = teamData["player2"] as String
        p3 = teamData["player3"] as String
        
        resultLbl.numberOfLines = 0
        
        tourneyNumLbl.text = "\(season) Tournament"
        
        for i in 0...9{
            var wOrL = ""
            
            if record [i] > 0 {
                wOrL = "W"
            } else if record [i] < 0{
                wOrL = "L"
            } else{
                wOrL = ""
            }
           recordString =  recordString + "\(wOrL) (\(record[i]))\n"
        }
        resultLbl.text = recordString
        
        championshipLbl.numberOfLines = 0
        championshipLbl.text = "\(p1)\n\(p2)\n\(p3)"
        
        for i in 1...10{
            var roundSchedule: [Int] = getRoundSchedule(i)
            var roundPlacement: Int = find(roundSchedule, teamNum)!
            
            
//            for c in 0...15{
//                if roundSchedule[c] == teamNum {
//                    roundPlacement = c
//                    break
//                }
//            }
            
            if roundPlacement % 2 == 0{
                scheduleString = scheduleString + "Round \(i): \(getTeamNameFromNumber(roundSchedule[roundPlacement+1]))\n"
            } else {
                scheduleString = scheduleString + "Round \(i): \(getTeamNameFromNumber(roundSchedule[roundPlacement-1]))\n"
            }
        }
        
        scheduleLbl.numberOfLines = 0
        scheduleLbl.text = scheduleString
        
        
    }
    

    
}