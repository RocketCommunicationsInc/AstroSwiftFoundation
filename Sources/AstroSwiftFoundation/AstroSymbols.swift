//
//  AstroSymbols.swift
//
//  Created by rocketjeff on 4/17/19.
//  Copyright © 2019 Rocket Communications, Inc. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(watchOS)
import WatchKit
#endif

#if os(macOS)
import AppKit
#endif

// Extend UIImage to include many conveniece methods to access Astro Status symbols
#if os(iOS) || os(tvOS) || os(watchOS)
public extension UIImage
{
    //——————————————————————————————————————————————————————————————————————————————
    // Astro Status symbols
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:UIImage
    {
        return UIImage(named: "astroStatusOffSymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusStandby:UIImage
    {
        return UIImage(named:"astroStatusStandbySymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusNormal:UIImage
    {
        return UIImage(named:"astroStatusNormalSymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusCaution:UIImage
    {
        return UIImage(named:"astroStatusCautionSymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusSerious:UIImage
    {
        return UIImage(named:"astroStatusSeriousSymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusCritical:UIImage
    {
        return UIImage(named:"astroStatusCriticalSymbol", in: .module, compatibleWith: nil)!
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
#endif


// Extend NSImage to include many conveniece methods to access Astro Status symbols
#if os(macOS)
extension NSImage
{
    //——————————————————————————————————————————————————————————————————————————————
    // Astro Status symbols
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:NSImage
    {
        return NSImage(named: "astroStatusOffSymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusStandby:NSImage
    {
        return NSImage(named:"astroStatusStandbySymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusNormal:NSImage
    {
        return NSImage(named:"astroStatusNormalSymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusCaution:NSImage
    {
        return NSImage(named:"astroStatusCautionSymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusSerious:NSImage
    {
        return NSImage(named:"astroStatusSeriousSymbol", in: .module, compatibleWith: nil)!
    }
    
    static var astroStatusCritical:NSImage
    {
        return NSImage(named:"astroStatusCriticalSymbol", in: .module, compatibleWith: nil)!
    }

    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status symbol for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func imageForAstroStatus(_ status:AstroStatus)->NSImage
    {
        switch status {
        case .Off:
            return NSImage.astroStatusOff
        case .Standby:
            return NSImage.astroStatusStandby
        case .Normal:
            return NSImage.astroStatusNormal
        case .Caution:
            return NSImage.astroStatusCaution
        case .Serious:
            return NSImage.astroStatusSerious
        case .Critical:
            return NSImage.astroStatusCritical
        }
    }

}
#endif
