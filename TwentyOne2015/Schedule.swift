//
//  Schedule.swift
//  TwentyOne2015
//
//  Created by Pat McGuire on 2/12/15.
//  Copyright (c) 2015 brilliant. All rights reserved.
//

import Foundation

func getRoundSchedule (round: Int) -> Array<Int>{
    
    var schedule: [Int] = []
    
    let round1 = [1,2,3,9,4,15,5,10,6,14,7,11,8,12,13,16]
    let round2 = [5,8,4,11,1,16,2,10,9,15,3,6,7,14,12,13]
    let round3 = [1,11,9,10,8,16,2,14,3,12,5,13,7,15,4,6]
    let round4 = [11,14,6,16,1,7,3,5,13,15,4,10,2,12,8,9]
    let round5 = [4,12,1,9,7,8,3,11,2,5,10,15,14,16,6,13]
    let round6 = [8,15,2,13,6,11,1,14,5,9,10,12,7,16,3,4]
    let round7 = [5,15,4,14,7,9,11,13,1,3,8,10,12,16,2,6]
    let round8 = [6,8,1,13,10,11,3,7,4,5,12,15,9,14,2,16]
    let round9 = [1,10,3,13,5,12,14,15,2,9,11,16,4,8,6,7]
    let round10 = [5,7,2,4,11,12,3,15,9,16,8,13,10,14,1,6]
    
    
    if round == 1 {
        schedule = round1
    }else if round == 2{
        schedule = round2
    }else if round == 3{
        schedule = round3
    }else if round == 4{
        schedule = round4
    }else if round == 5{
        schedule = round5
    }else if round == 6{
        schedule = round6
    }else if round == 7{
        schedule = round7
    }else if round == 8{
        schedule = round8
    }else if round == 9{
        schedule = round9
    }else if round == 10{
        schedule = round10
    }
    
    
    
    return schedule
}