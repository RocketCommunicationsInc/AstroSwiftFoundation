//
//  CentralTimer.swift
//  
//
//  Created by Jeff Hokit on 1/16/23.
//

import Foundation

// create a central timer shared by onscreen clocks and countdown timers so their ticks are synchronized
var centralTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
