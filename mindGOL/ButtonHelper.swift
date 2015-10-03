//
//  ButtonHelper.swift
//  mindGOL
//
//  Created by Khoo Chun Qhai on 10/3/15.
//  Copyright © 2015 ChunQhai. All rights reserved.
//

import Foundation

var timer: NSTimer = NSTimer()

class ButtonTimer :NSTimer{
    
    
    static func getTimer()-> NSTimer {
        return timer
    }
    
    static func stopTimer() {
        timer.invalidate()
    }
   
}
