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
    
    let correctPassword = "21"
    var passwordEntered = ""
    
    
    @IBOutlet weak var newWordField: UITextField!
    func wordEntered(alert: UIAlertAction!){
        // store the new word
        passwordEntered = self.newWordField.text
        
        if passwordEntered == correctPassword{
            initializeData()
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

