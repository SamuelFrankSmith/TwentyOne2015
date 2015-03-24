//
//  ViewController.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/11/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBAction func showAlert(){
//        let actionSheetController: UIAlertController = UIAlertController(title: "Initialize Data", message: "Type password to initialize data. This will permenantly erase all game data. Do not do this unless it is the beginning of the tournament!", preferredStyle: .Alert)
//        
//        //Create and add the Cancel action
//        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
//            //Do some stuff
//        }
//        actionSheetController.addAction(cancelAction)
//        //Create and an option action
//        let nextAction: UIAlertAction = UIAlertAction(title: "Next", style: .Default) { action -> Void in
//            
//        }
//        //Present the AlertController
//        self.presentViewController(actionSheetController, animated: true, completion: nil)
//    }
    
//    var buttonOneCount = 0
//    var buttonTwoCount = 0
//    
//    @IBAction func hiddenInitialIzeBtn(sender: AnyObject) {
//        
//        buttonOneCount = buttonOneCount + 1
//        
//    }
//    
//    @IBAction func hiddenBtn2(sender: AnyObject) {
//        
//        buttonTwoCount = buttonTwoCount + 1
//        
//        
//        if buttonOneCount != 7 {
//            buttonOneCount = 0
//        } else if buttonOneCount == 7{
//            if buttonTwoCount == 3{
//                
//            }
//        }
//    }
    
    let correctPassword = "F2i8wrck"
    var passwordEntered = ""
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
        let newWordPrompt = UIAlertController(title: "What's the password?", message: "Initializing data is usually a horrible idea. You have to know the password in order to do it.", preferredStyle: UIAlertControllerStyle.Alert)
        newWordPrompt.addTextFieldWithConfigurationHandler(addTextField)
        newWordPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        newWordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: wordEntered))
        presentViewController(newWordPrompt, animated: true, completion: nil)
        
    }

    @IBAction func initializeBtn(sender: AnyObject) {
        displayAlert()
        if admin == true{
            initializeData()
        }
        
    }
    
    @IBAction func InitializePlayoffs(sender: AnyObject) {
        displayAlert()
        if admin == true{
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
                        team["PlayoffArray"] = [0,0,0,0,0]
                        team.save()
                    }
                }
            }
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

