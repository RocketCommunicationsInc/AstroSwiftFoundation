//
//  AstroSymbols.swift
//
//  Created by rocketjeff on 4/17/19.
//  Copyright © 2019 Rocket Communications, Inc. All rights reserved.
//

#if os(iOS)
import UIKit
#endif

// Extend UIImage to include many conveniece methods to access Astro Status symbols
extension UIImage
{
    //——————————————————————————————————————————————————————————————————————————————
    // Astro Status symbols
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:UIImage
    {
        return UIImage(named: "astroStatusOffSymbol")!
    }
    
    static var astroStatusStandby:UIImage
    {
        return UIImage(named:"astroStatusStandbySymbol")!
    }
    
    static var astroStatusNormal:UIImage
    {
        return UIImage(named:"astroStatusNormalSymbol")!
    }
    
    static var astroStatusCaution:UIImage
    {
        return UIImage(named:"astroStatusCautionSymbol")!
    }
    
    static var astroStatusSerious:UIImage
    {
        return UIImage(named:"astroStatusSeriousSymbol")!
    }
    
    static var astroStatusCritical:UIImage
    {
        return UIImage(named:"astroStatusCriticalSymbol")!
    }

    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status symbol for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func imageForAstroStatus(_ status:AstroStatus)->UIImage
    {
        switch status {
        case .Off:
            return UIImage.astroStatusOff
        case .Standby:
            return UIImage.astroStatusStandby
        case .Normal:
            return UIImage.astroStatusNormal
        case .Caution:
            return UIImage.astroStatusCaution
        case .Serious:
            return UIImage.astroStatusSerious
        case .Critical:
            return UIImage.astroStatusCritical
        }
    }

}

