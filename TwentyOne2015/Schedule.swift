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
    let round2 = [1,16,2,10,3,6,4,11,5,8,7,14,9,15,12,13]
    let round3 = [1,11,2,14,3,12,4,6,5,13,7,15,8,16,9,10]
    let round4 = [1,7,2,12,3,5,4,10,6,16,8,9,11,14,13,15]
    let round5 = [1,9,2,5,3,11,4,12,6,13,7,8,10,15,14,16]
    let round6 = [1,14,2,13,3,4,5,9,6,11,7,16,8,15,10,12]
    let round7 = [1,3,2,6,4,14,5,15,7,9,8,10,11,13,12,16]
    let round8 = [1,13,2,16,3,7,4,5,6,8,9,14,10,11,12,15]
    let round9 = [1,10,2,9,3,13,4,8,5,12,6,7,11,16,14,15]
    let round10 = [1,6,2,4,3,15,5,7,8,13,9,16,10,14,11,12]
    
    
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