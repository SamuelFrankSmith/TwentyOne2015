//
//  PlayoffsR1.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 3/2/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import Foundation
import UIKit

class PlayoffsR1: UIViewController {
    
    @IBOutlet weak var seed1Btn: UIButton!
    @IBOutlet weak var seed16Btn: UIButton!
    @IBOutlet weak var seed8Btn: UIButton!
    @IBOutlet weak var seed9Btn: UIButton!
    @IBOutlet weak var seed4Btn: UIButton!
    @IBOutlet weak var seed13Btn: UIButton!
    @IBOutlet weak var seed5Btn: UIButton!
    @IBOutlet weak var seed12Btn: UIButton!
    @IBOutlet weak var seed2Btn: UIButton!
    @IBOutlet weak var seed15Btn: UIButton!
    @IBOutlet weak var seed7Btn: UIButton!
    @IBOutlet weak var seed10Btn: UIButton!
    @IBOutlet weak var seed3Btn: UIButton!
    @IBOutlet weak var seed14Btn: UIButton!
    @IBOutlet weak var seed6Btn: UIButton!
    @IBOutlet weak var seed11Btn: UIButton!
    
    var curPlayoffRecord: [Int] = []
    
    var passwordEntered = ""
    var correctPassword = "  Y6"
    var admin = false
    
    @IBOutlet weak var newWordField: UITextField!
    func wordEntered(alert: UIAlertAction!){
        // store the new word
        passwordEntered = self.newWordField.text
        
        if passwordEntered == correctPassword{
            admin = true
        } else {
            displayAlert()
        }
    }
    
    func addTextField(textField: UITextField!){
        // add the text field and make the result global
        textField.placeholder = "Password"
        self.newWordField = textField
    }
    
    
    func displayAlert(){
        let newWordPrompt = UIAlertController(title: "Are you worthy?", message: "Prove you're worthy of entering playoff winners by entering the password", preferredStyle: UIAlertControllerStyle.Alert)
        newWordPrompt.addTextFieldWithConfigurationHandler(addTextField)
        newWordPrompt.addAction(UIAlertAction(title: "I'm not worthy", style: UIAlertActionStyle.Default, handler: nil))
        newWordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: wordEntered))
        presentViewController(newWordPrompt, animated: true, completion: nil)
        
    }
    
    @IBAction func seed1BtnTap(sender: AnyObject) {
        if admin == true{
            seed16Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed1Btn.selected = true
            seed16Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[0])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[15])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            
            team2.save()
        }
    }
    
    @IBAction func seed16BtnTap(sender: AnyObject) {
        if admin == true{
            seed1Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed16Btn.selected = true
            seed1Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[15])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[0])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            
            team2.save()
        }

    }

    @IBAction func seed8BtnTap(sender: AnyObject) {
        if admin == true{
            seed9Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed8Btn.selected = true
            seed9Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[7])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            println(team["teamName"])
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[8])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            println(team2["teamName"])
            
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            
            team2.save()
            
        }
    }
    
    @IBAction func seed9BtnTap(sender: AnyObject) {
        if admin == true{
            seed8Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed9Btn.selected = true
            seed8Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[8])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[7])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            
            team2.save()
        }

    }
    
    @IBAction func seed4BtnTap(sender: AnyObject) {
        if admin == true{
            seed13Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed4Btn.selected = true
            seed13Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[3])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[12])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
        }

    }
    
    @IBAction func seed13BtnTap(sender: AnyObject) {
        if admin == true{
            seed4Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed13Btn.selected = true
            seed4Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[12])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[3])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
        }
    }
    
    @IBAction func seed5BtnTap(sender: AnyObject) {
        if admin == true{
            seed12Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed5Btn.selected = true
            seed12Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[4])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[11])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
        }
    }
    
    @IBAction func seed12BtnTap(sender: AnyObject) {
        if admin == true{
            seed5Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed12Btn.selected = true
            seed5Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[11])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[4])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
        }

    }
    
    @IBAction func seed2BtnTap(sender: AnyObject) {
        if admin == true{
            seed15Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed2Btn.selected = true
            seed15Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[1])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[14])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
            
        }
    }

    @IBAction func seed15BtnTap(sender: AnyObject) {
        if admin == true{
            seed2Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed15Btn.selected = true
            seed2Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[14])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[1])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
            
        }

    }

    @IBAction func seed7BtnTap(sender: AnyObject) {
        if admin == true{
            seed10Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed7Btn.selected = true
            seed10Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[6])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[10])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
            
        }
    }

    @IBAction func seed10BtnTap(sender: AnyObject) {
        if admin == true{
            seed7Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed10Btn.selected = true
            seed7Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[10])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[6])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
            
        }
    }
    
    @IBAction func seed3BtnTap(sender: AnyObject) {
        if admin == true{
            seed14Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed3Btn.selected = true
            seed14Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[2])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[13])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
        }

    }
    
    @IBAction func seed14BtnTap(sender: AnyObject) {
        if admin == true{
            seed3Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed14Btn.selected = true
            seed3Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[13])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[2])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
        }
    }
    
    @IBAction func seed6BtnTap(sender: AnyObject) {
        if admin == true{
            seed11Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed6Btn.selected = true
            seed11Btn.selected = false
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[5])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[10])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
        }
    }
    
    @IBAction func seed11BtnTap(sender: AnyObject) {
        if admin == true{
            seed6Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed11Btn.selected = true
            seed6Btn.selected = false
            
            
            var query = PFQuery(className: "Team")
            query.whereKey("teamName", equalTo: rankingsArray[10])
            var team = query.getFirstObject()
            var playoffRecord: [Int] = team["PlayoffArray"] as Array!
            
            playoffRecord[0] = 1
            
            team["PlayoffArray"] = playoffRecord
            team.save()
            
            
            var query2 = PFQuery(className: "Team")
            query2.whereKey("teamName", equalTo: rankingsArray[5])
            var team2 = query2.getFirstObject()
            var playoffRecord2: [Int] = team2["PlayoffArray"] as Array!
            
            playoffRecord2[0] = 0
            
            team2["PlayoffArray"] = playoffRecord2
            team2.save()
        }
    }
    
    
    
    
    var rankingsArray: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    var recordArray: [String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]
    var rankingsString: String = ""
    var recordString: String = ""
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        displayAlert()
        
        //code for getting current rankings
        
        
        for i in 1...16{
            
            var query = PFQuery(className: "Team")
            query.whereKey("rank", equalTo: i)
            var object = query.getFirstObject()
            
            var teamName = object["teamName"] as String!
            var teamWins = object["wins"] as Int!
            var teamLosses = object ["losses"] as Int!
            var teamCD = object ["CD"] as Int!
            var teamCDWithCharacter: String = ""
            var curPlayRecord:[Int] = object["PlayoffArray"] as Array!
            curPlayoffRecord.append(curPlayRecord[0])
            if teamCD >= 0{
                teamCDWithCharacter = "+\(teamCD)"
            } else {
                teamCDWithCharacter = "\(teamCD)"
            }
            var teamRecord = "(\(teamWins) - \(teamLosses))  \(teamCDWithCharacter)"
            
            self.recordArray[i-1] = teamRecord
            self.rankingsArray[i-1] = teamName
            
        }
        
        
        seed1Btn.setTitle("#1 \(rankingsArray[0])", forState: .Normal)
        seed2Btn.setTitle("#2 \(rankingsArray[1])", forState: .Normal)
        seed3Btn.setTitle("#3 \(rankingsArray[2])", forState: .Normal)
        seed4Btn.setTitle("#4 \(rankingsArray[3])", forState: .Normal)
        seed5Btn.setTitle("#5 \(rankingsArray[4])", forState: .Normal)
        seed6Btn.setTitle("#6 \(rankingsArray[5])", forState: .Normal)
        seed7Btn.setTitle("#7 \(rankingsArray[6])", forState: .Normal)
        seed8Btn.setTitle("#8 \(rankingsArray[7])", forState: .Normal)
        seed9Btn.setTitle("#9 \(rankingsArray[8])", forState: .Normal)
        seed10Btn.setTitle("#10 \(rankingsArray[9])", forState: .Normal)
        seed11Btn.setTitle("#11 \(rankingsArray[10])", forState: .Normal)
        seed12Btn.setTitle("#12 \(rankingsArray[11])", forState: .Normal)
        seed13Btn.setTitle("#13 \(rankingsArray[12])", forState: .Normal)
        seed14Btn.setTitle("#14 \(rankingsArray[13])", forState: .Normal)
        seed15Btn.setTitle("#15 \(rankingsArray[14])", forState: .Normal)
        seed16Btn.setTitle("#16 \(rankingsArray[15])", forState: .Normal)
        
        if curPlayoffRecord[0] == 1 {
            seed16Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed1Btn.selected = true
            seed16Btn.selected = false
        }
        if curPlayoffRecord[15] == 1 {
            seed1Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed16Btn.selected = true
            seed1Btn.selected = false
        }
        if curPlayoffRecord[7] == 1 {
            seed9Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed8Btn.selected = true
            seed9Btn.selected = false
        }
        if curPlayoffRecord[8] == 1{
            seed8Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed9Btn.selected = true
            seed8Btn.selected = false
        }
        if curPlayoffRecord[3] == 1{
            seed13Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed4Btn.selected = true
            seed13Btn.selected = false
        }
        if curPlayoffRecord[12] == 1{
            seed4Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed13Btn.selected = true
            seed4Btn.selected = false
        }
        if curPlayoffRecord[4] == 1{
            seed12Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed5Btn.selected = true
            seed12Btn.selected = false
        }
        if curPlayoffRecord[11] == 1{
            seed5Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed12Btn.selected = true
            seed5Btn.selected = false
        }
        if curPlayoffRecord[1] == 1{
            seed15Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed2Btn.selected = true
            seed15Btn.selected = false
        }
        if curPlayoffRecord[14] == 1{
            seed2Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed15Btn.selected = true
            seed2Btn.selected = false
        }
        if curPlayoffRecord[6] == 1{
            seed10Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed7Btn.selected = true
            seed10Btn.selected = false
        }
        if curPlayoffRecord[9] == 1{
            seed7Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed10Btn.selected = true
            seed7Btn.selected = false
        }
        if curPlayoffRecord[2] == 1{
            seed14Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed3Btn.selected = true
            seed14Btn.selected = false
        }
        if curPlayoffRecord[13] == 1{
            seed3Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed14Btn.selected = true
            seed3Btn.selected = false
        }
        if curPlayoffRecord[5] == 1{
            seed11Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed6Btn.selected = true
            seed11Btn.selected = false
        }
        if curPlayoffRecord[10] == 1{
            seed6Btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            seed11Btn.selected = true
            seed6Btn.selected = false
        }
        
        activityIndicator.stopAnimating()
    }
    
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        
        seed1Btn.setTitle("", forState: .Normal)
        seed2Btn.setTitle("", forState: .Normal)
        seed3Btn.setTitle("", forState: .Normal)
        seed4Btn.setTitle("", forState: .Normal)
        seed5Btn.setTitle("", forState: .Normal)
        seed6Btn.setTitle("", forState: .Normal)
        seed7Btn.setTitle("", forState: .Normal)
        seed8Btn.setTitle("", forState: .Normal)
        seed9Btn.setTitle("", forState: .Normal)
        seed10Btn.setTitle("", forState: .Normal)
        seed11Btn.setTitle("", forState: .Normal)
        seed12Btn.setTitle("", forState: .Normal)
        seed13Btn.setTitle("", forState: .Normal)
        seed14Btn.setTitle("", forState: .Normal)
        seed15Btn.setTitle("", forState: .Normal)
        seed16Btn.setTitle("", forState: .Normal)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToR2"
        {
            if let destinationVC = segue.destinationViewController as? PlayoffsR2{
                destinationVC.teamRankArray = rankingsArray
                destinationVC.admin = admin
            }
        }

    }

    
}