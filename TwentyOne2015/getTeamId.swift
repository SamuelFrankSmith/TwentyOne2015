//
//  getTeamId.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/12/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import Foundation

func getTeamId (teamNum: Int) -> String{
    
//    #1. Salisbury = "L89EcuMeDz"
//    #2. Purdue = "m77Ffi4iYk"
//    #3. Morehead = "nSgUdbIWVa"
//    #4. Illinois = "0a3QtCTyej"
//    #5. Duke = "5vSP2bXKdH"
//    #6. America = "ljCV4fz6Pw"
//    #7. Phoenix = "VoCdWZce2O"
//    #8. GAMU = "P273Yw1lS6"
//    #9. SMU = "8vk6hSqQPj"
//    #10. Indiana = "UqYi6HCyUe"
//    #11. Lincoln Land = "ad1T70EBmD"
//    #12. Iowa = "IFntLhNac2"
//    #13. Asheville = "yrUnBoLGXH"
//    #14. Granada = "UBIDBRm48C"
//    #15. UTI = "9x8LWIRLgk"
//    #16. Oregon State = "RvmHbDBsNx"
    
    
    
    var teamRankList: [String] = ["L89EcuMeDz", "m77Ffi4iYk", "nSgUdbIWVa", "0a3QtCTyej", "5vSP2bXKdH", "ljCV4fz6Pw", "VoCdWZce2O", "P273Yw1lS6", "8vk6hSqQPj", "UqYi6HCyUe", "ad1T70EBmD", "IFntLhNac2", "yrUnBoLGXH", "UBIDBRm48C", "9x8LWIRLgk", "RvmHbDBsNx"]
    
    
    var teamId = teamRankList[teamNum - 1]
    
    
    return teamId
}

func getTeamNameFromNumber (teamNumber: Int) -> String{
    
    
    var teamNameList = ["Salisbury State", "Purdue", "Morehead State", "Illinois", "Duke", "America University", "Phoenix", "Grown Ass Man U", "SMU", "Indiana", "Lincoln Land", "Iowa", "Asheville", "Granada", "UTI", "Oregon State"]
    
    var teamName = teamNameList[teamNumber-1]
    
    
    return teamName
}