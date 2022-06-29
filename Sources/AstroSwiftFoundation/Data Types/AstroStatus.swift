//
//  AstroStatus.swift
//
//  Created by rocketjeff on 3/27/19.
//

import Foundation
import SwiftUI

// The basic 6 Astro Statuses, used by AstroColors and AstroSymbols, or for any code tracking status
public enum AstroStatus {
    
    case off
    case standby
    case normal
    case caution
    case serious
    case critical
    

    //——————————————————————————————————————————————————————————————————————————————
    // Return the description
    //——————————————————————————————————————————————————————————————————————————————
    public var description: String {
        switch self {
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
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    public var color:Color
    {
        switch self {
        case .off:
            return Color.astroStatusOff
        case .standby:
            return Color.astroStatusStandby
        case .normal:
            return Color.astroStatusNormal
        case .caution:
            return Color.astroStatusCaution
        case .serious:
            return Color.astroStatusSerious
        case .critical:
            return Color.astroStatusCritical
        }
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Return the image for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    public var image:Image
    {
        switch self {
        case .off:
            return Image.astroStatusOff
        case .standby:
            return Image.astroStatusStandby
        case .normal:
            return Image.astroStatusNormal
        case .caution:
            return Image.astroStatusCaution
        case .serious:
            return Image.astroStatusSerious
        case .critical:
            return Image.astroStatusCritical
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
    
    // Obsolete, warn that case names were changed
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

}


