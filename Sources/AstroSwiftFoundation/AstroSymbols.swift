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

import SwiftUI


// Extend Image to include many conveniece methods to access Astro Status symbols
public extension Image
{
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the UIImage constructor to return a debug image instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroImage(_ named:String)->Image
    {
        #if os(iOS) || os(tvOS)
        return Image(named)

        #endif
        
        #if os(watchOS)
        return Image(named)
        #endif
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Astro Status symbols
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:Image
    {
        return Image("off")
    }
    
    static var astroStatusStandby:Image
    {
        return astroImage("standby")
    }
    
    static var astroStatusNormal:Image
    {
        return astroImage("normal")
    }
    
    static var astroStatusCaution:Image
    {
        return astroImage("caution")
    }
    
    static var astroStatusSerious:Image
    {
        return astroImage("serious")
    }
    
    static var astroStatusCritical:Image
    {
        return astroImage("critical")
    }


}

// Extend UIImage to include many conveniece methods to access Astro Status symbols
#if os(iOS) || os(tvOS) || os(watchOS)
public extension UIImage
{
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the UIImage constructor to return a debug image instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroImage(named:String)->UIImage
    {
        #if os(iOS) || os(tvOS)
        return UIImage(named: named, in: .module, compatibleWith: nil) ?? UIImage(systemName: "nosign")!

        #endif
        
        #if os(watchOS)
        return UIImage(named:named) ?? UIImage(systemName: "nosign")!
        #endif
    }
    
    
    //——————————————————————————————————————————————————————————————————————————————
    // Astro Status symbols
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:UIImage
    {
        return astroImage(named: "Astro Status Off Symbol")
    }
    
    static var astroStatusStandby:UIImage
    {
        return astroImage(named:"Astro Status Standby Symbol")
    }
    
    static var astroStatusNormal:UIImage
    {
        return astroImage(named:"Astro Status Normal Symbol")
    }
    
    static var astroStatusCaution:UIImage
    {
        return astroImage(named:"Astro Status Caution Symbol")
    }
    
    static var astroStatusSerious:UIImage
    {
        return astroImage(named:"Astro Status Serious Symbol")
    }
    
    static var astroStatusCritical:UIImage
    {
        return astroImage(named:"Astro Status Critical Symbol")
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
    // Wrap the the NSImage constructor to return a debug image instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroImage(named:String)->NSImage
    {
        return NSImage(named:named) ?? NSImage(named:NSImage.stopProgressFreestandingTemplateName)!
    }

    //——————————————————————————————————————————————————————————————————————————————
    // Astro Status symbols
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:NSImage
    {
        return astroImage(named: "Astro Status Off Symbol")
    }
    
    static var astroStatusStandby:NSImage
    {
        return astroImage(named:"Astro Status Standby Symbol")
    }
    
    static var astroStatusNormal:NSImage
    {
        return astroImage(named:"Astro Status Normal Symbol")
    }
    
    static var astroStatusCaution:NSImage
    {
        return astroImage(named:"Astro Status Caution Symbol")
    }
    
    static var astroStatusSerious:NSImage
    {
        return astroImage(named:"Astro Status Serious Symbol")
    }
    
    static var astroStatusCritical:NSImage
    {
        return astroImage(named:"Astro Status Critical Symbol")
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
