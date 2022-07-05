//
//  AstroStatus.swift
//
//  Created by rocketjeff on 3/27/19.
//

import Foundation
import SwiftUI

/// Astro Status levels
///
/// Consistent use of colors and symbols to convey status is critical for user success.
/// AstroStatus  represents the **six** Astro Status levels that we recommend for your app.
///
/// Status is often displayed with a ``Status`` View in SwiftUI apps, or ``StatusView`` in UIKit and AppKit apps.
///
/// You may also apply status colors for to other SwiftUI elements, using the ``AstroStatus/color`` property.
///
///  Read more about the [Astro Status System](https://www.astrouxds.com/patterns/status-system/).
public enum AstroStatus {
    case off
    case standby
    case normal
    case caution
    case serious
    case critical
    
    /**
    An English description of the Status
     
    This is the canonical name of the AstroStatus. Synonymous are also allowed, such as Nominal for Normal.
    */
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
    
    /**
    The color representing the AstroStatus.
     
    The color should not be altered.
    */
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
    
    /**
    The symbol representing the AstroStatus
     
    The symbol should not be altered.
     
    Status is often displayed with a ``Status`` View in SwiftUI apps, or ``StatusView`` in UIKit and AppKit apps
    */
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
    
    /**
    A random AstroStatus.
     
     Useful for debugging or demo.
    */
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


