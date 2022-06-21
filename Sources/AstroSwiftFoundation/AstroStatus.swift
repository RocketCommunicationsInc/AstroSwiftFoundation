//
//  AstroStatus.swift
//
//  Created by rocketjeff on 3/27/19.
//  Copyright © 2019 Rocket Communications, Inc. All rights reserved.
//

import Foundation

// The basic 6 Astro Statuses, used by AstroColors and AstroSymbols, or for any code tracking status
public enum AstroStatus {
    @available(*, unavailable , renamed: "off")
    case Off
    @available(*, unavailable , renamed: "standby")
    case Standby
    @available(*, unavailable , renamed: "normal")
    case Normal
    @available(*, unavailable , renamed: "caution")
    case Caution
    @available(*, unavailable , renamed: "serious")
    case Serious
    @available(*, unavailable , renamed: "critical")
    case Critical
    
    case off
    case standby
    case normal
    case caution
    case serious
    case critical

    public var description: String {
        switch self
        {
        case .off:
            return "Off"
        case .standby:
            return "Standby"
        case .normal:
            return "Normal"
        case .caution:
            return "Caution"
        case .serious:
            return "Serious"
        case .critical:
            return "Critical"
        }
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Return a random AstroStatus.
    // Useful for debugging or demo.
    //——————————————————————————————————————————————————————————————————————————————
    public static func randomStatus()->AstroStatus
    {
        let randomIndex = Int.random(in: 0 ... 5)
        switch randomIndex
        {
        case 0:
            return .off
        case 1:
            return .standby
        case 2:
            return .normal
        case 3:
            return .caution
        case 4:
            return .serious
        case 5:
            return .critical
            
        default:
            return .off
        }
    }
}
