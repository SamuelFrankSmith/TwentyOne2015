//
//  GameScreen.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/12/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import UIKit
import Foundation

class GameScreen: UIViewController, UITextFieldDelegate {
    
    let correctPassword = "  Y6"
    var passwordEntered = ""
    
    var roundNumber = 0
    var teamOneName = ""
    var teamTwoName = ""
    var teamOneNumber = 0
    var teamTwoNumber = 0
    var winner = 0
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var cupDifTxt: UITextField!
    
    @IBOutlet weak var teamOneBtn: UIButton!
    
    @IBOutlet weak var teamTwoBtn: UIButton!
    
    @IBOutlet weak var resultsLbl: UILabel!
    
    @IBOutlet weak var teamOneCurRecord: UILabel!
    
    @IBOutlet weak var teamTwoCurRecord: UILabel!
    
    
    @IBAction func teamOneBtnTouchDown(sender: AnyObject) {
        winner = 1
        teamOneBtn.selected = true
        teamTwoBtn.selected = false
    }
    
    @IBAction func teamTwoBtnTouchDown(sender: AnyObject) {
        winner = 2
        teamTwoBtn.selected = true
        teamOneBtn.selected = false
    }
    
    
    @IBOutlet weak var newWordField: UITextField!
    func wordEntered(alert: UIAlertAction!){
        // store the new word
        passwordEntered = self.newWordField.text
        
        if passwordEntered == correctPassword{
            submitScore()
            
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
        let newWordPrompt = UIAlertController(title: "What's the password?", message: "Can't have everyone changing scores all willynilly. Enter the password to submit the score.", preferredStyle: UIAlertControllerStyle.Alert)
        newWordPrompt.addTextFieldWithConfigurationHandler(addTextField)
        newWordPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        newWordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: wordEntered))
        presentViewController(newWordPrompt, animated: true, completion: nil)
        
    }
    
    
    @IBAction func enterBtn(sender: AnyObject){
        if cupDifTxt.text == ""{
            
            var alert = UIAlertController(title: "Enter Cup Differential", message: "You forgot to enter a cup differential.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if winner == 0{
            
            var alert = UIAlertController(title: "Pick a winner", message: "Choose a winner for this game.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if cupDifTxt.text.toInt() < 0 {
            
            var alert = UIAlertController(title: "Positive Cup Differential", message: "The cup differential cannot be negative.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else if cupDifTxt.text.toInt() == 0 {
            
            var alert = UIAlertController(title: "Idiot", message: "The cup differential can not be 0 ya idiot.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if cupDifTxt.text.toInt() > 21 {
            
            var alert = UIAlertController(title: "Liar", message: "The cup differential can not be over 21 ya damn liar.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else {
        activityIndicator.startAnimating()
        displayAlert()
        }
    }
    
    
    func submitScore(){
    
        //What team number is Team 1?
        var teamOne: Int = teamOneNumber
        
        //What team number is Team 2?
        var teamTwo: Int = teamTwoNumber
        
        //What was the cup differential?
        
        var cupDif: Int = cupDifTxt.text.toInt()!
        
        //What is the round number?
        var round: Int = roundNumber
        
        //Get to object IDs for the two teams that played
        var teamOneId = getTeamId(teamOne)
        var teamTwoId = getTeamId(teamTwo)
        
        
//If team 1 wins
        if winner == 1{
            
            //Query for Team 1's database entry
            var query = PFQuery(className: "Team")
            var team1 = query.getObjectWithId(teamOneId)
            
            //Query for Team 2's database entry
            var query2 = PFQuery(className: "Team")
            var team2 = query2.getObjectWithId(teamTwoId)
            
//            query.getObjectInBackgroundWithId(teamOneId){
//                (team1: PFObject!, error: NSError!) -> Void in
//                if error != nil{
                    //Error scenario here
//                    NSLog("%@", error)
//                } else {
            
            //Find the current record array
            var curRecord: [Int] = team1["recordArray"] as Array
                    
            //Array locally to reflect the last game played
            curRecord[round-1] = cupDif
                    
            //Update the W/L/CD stats based on the last game played
            var wins = 0
            var losses = 0
            var CD = 0
                    
                for i in 0...9{
                        
                    CD = CD + curRecord [i]
                        
                    if curRecord[i] > 0{
                        wins = wins + 1
                    } else if curRecord[i] < 0 {
                        losses = losses + 1
                    }
                }
                //Update w/l/cd and recordArray Stats
                team1["wins"] = wins
                team1["losses"] = losses
                team1["CD"] = CD
                team1["recordArray"] = curRecord
                    
                //Save the data
                team1.save()
            
                var curRecord2: [Int] = team2["recordArray"] as Array
                    
                curRecord2[round-1] = -cupDif
                    
                for i in 0...9{
                    println("Team 2 Round \(i+1): \(curRecord[i])")
                }
                    //Update the W/L/CD stats based on the last game played
                var wins2 = 0
                var losses2 = 0
                var CD2 = 0
                    
                for i in 0...9{
                        
                    CD2 = CD2 + curRecord2[i]
                        
                    if curRecord2[i] > 0{
                        wins2 = wins2 + 1
                    } else if curRecord2[i] < 0 {
                        losses2 = losses2 + 1
                    }
                }
                    //Update w/l/cd and recordArray Stats
                team2["wins"] = wins2
                team2["losses"] = losses2
                team2["CD"] = CD2
                team2["recordArray"] = curRecord2
                    
                //Save the data
                team2.save()
            
    }
        //If team 2 wins
        else if winner == 2{
            
            //Query for Team 1's database entry
            var query = PFQuery(className: "Team")
            var team1 = query.getObjectWithId(teamOneId)
            
            
            //Find the current entries
            var curRecord: [Int] = team1["recordArray"] as Array
                    
            curRecord[round-1] = -cupDif
                    
            for i in 0...9{
                println("Team 1 Round \(i+1): \(curRecord[i])")
            }
            //Update the W/L/CD stats based on the last game played
            var wins = 0
            var losses = 0
            var CD = 0
                    
            for i in 0...9{
                        
                CD = CD + curRecord [i]
                        
                if curRecord[i] > 0{
                    wins = wins + 1
                } else if curRecord[i] < 0 {
                    losses = losses + 1
                }
            }
            //Update w/l/cd and recordArray Stats
            team1["wins"] = wins
            team1["losses"] = losses
            team1["CD"] = CD
            team1["recordArray"] = curRecord
            
            //Save the data
            team1.save()
        
        
            
        //Query for Team 2's database entry
        var query2 = PFQuery(className: "Team")
        var team2 = query2.getObjectWithId(teamTwoId)
            
            //Remember to change the team's objectID
                    //Find the current entries
                    var curRecord2: [Int] = team2["recordArray"] as Array
                    
                    curRecord2[round-1] = cupDif
                    
                    for i in 0...9{
                        println("Team 2 Round \(i+1): \(curRecord2[i])")
                    }
                    
                    //Update the W/L/CD stats based on the last game played
                    var wins2 = 0
                    var losses2 = 0
                    var CD2 = 0
                    
                    for i in 0...9{
                        
                        CD2 = CD2 + curRecord2 [i]
                        
                        if curRecord2[i] > 0{
                            wins2 = wins2 + 1
                        } else if curRecord2[i] < 0 {
                            losses2 = losses2 + 1
                        }
                    }
                    //Update w/l/cd and recordArray Stats
                    team2["wins"] = wins2
                    team2["losses"] = losses2
                    team2["CD"] = CD2
                    team2["recordArray"] = curRecord2
                    
                    //Save the data
                    team2.save()
                    
                }
        
            findResults()
            getCurrentStats()
        
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

    func updateRankings(teamname: String, rank: Int){
        var query = PFQuery(className: "Team")
        query.whereKey("teamName", equalTo: teamname)
        var object = query.getFirstObject()
                
//        println("\(teamname): \(rank)")
        
        object["teamName"] = teamname
        object["rank"] = rank
        object.save()

    }
    
    func findResults (){
        var teamOneId = getTeamId(teamOneNumber)
        var teamTwoId = getTeamId(teamTwoNumber)
        
        //Query for Team 1's database entry
        var query = PFQuery(className: "Team")
        var team1 = query.getObjectWithId(teamOneId)
        
        var query2 = PFQuery(className: "Team")
        var team2 = query2.getObjectWithId(teamTwoId)
        
        //Find the current entries
        var curRecord: [Int] = team1["recordArray"] as Array
        var gameResult = curRecord[roundNumber-1]
        var teamOneWins: Int = 0
        teamOneWins = team1["wins"] as Int!
        var teamOneLosses: Int = 0
        teamOneLosses = team1["losses"] as Int!
        teamOneCurRecord.text = "(\(teamOneWins) - \(teamOneLosses))"
        var teamTwoWins: Int = 0
        teamTwoWins = team2["wins"] as Int!
        var teamTwoLosses: Int = 0
        teamTwoLosses = team2["losses"] as Int!
        teamTwoCurRecord.text = "(\(teamTwoWins) - \(teamTwoLosses))"
        
        if gameResult > 0 {
            resultsLbl.text = "Game Result: \(teamOneName) won by \(gameResult)"
            teamOneBtn.selected = true
            cupDifTxt.text = "\(gameResult)"
        } else if gameResult < 0 {
            resultsLbl.text = "Game Result: \(teamTwoName) won by \(-gameResult)"
            teamTwoBtn.selected = true
            cupDifTxt.text = "\(-gameResult)"
        } else {
            resultsLbl.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        
        activityIndicator.startAnimating()
        
        teamOneBtn.titleLabel?.numberOfLines = 0
        teamOneBtn.setTitle(teamOneName, forState: .Normal)
//        teamOneBtn.titleLabel?.sizeToFit()
        teamTwoBtn.titleLabel?.numberOfLines = 0
        teamTwoBtn.setTitle(teamTwoName, forState: .Normal)
//        teamTwoBtn.titleLabel?.sizeToFit()
        resultsLbl.text = ""
        teamOneCurRecord.text = ""
        teamTwoCurRecord.text = ""
        cupDifTxt.delegate = self
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        findResults()
        
        activityIndicator.stopAnimating()
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
        
    }

}