//
//  AstroStatus.swift
//
//  Created by rocketjeff on 3/27/19.
//  Copyright © 2019 Rocket Communications, Inc. All rights reserved.
//

import Foundation

// The basic 6 Astro Statuses, used by AstroColors and AstroSymbols, or for any code tracking status
public enum AstroStatus {
    case Off
    case Standby
    case Normal
    case Caution
    case Serious
    case Critical
    
    
    //——————————————————————————————————————————————————————————————————————————————
    // Return a random AstroStatus.
    // Useful for debugging or demo.
    //——————————————————————————————————————————————————————————————————————————————
    static func randomStatus()->AstroStatus
    {
        let randomIndex = Int.random(in: 0 ... 5)
        switch randomIndex
        {
        case 0:
            return .Off
        case 1:
            return .Standby
        case 2:
            return .Normal
        case 3:
            return .Caution
        case 4:
            return .Serious
        case 5:
            return .Critical
            
        default:
            return .Off
        }
    }
}
