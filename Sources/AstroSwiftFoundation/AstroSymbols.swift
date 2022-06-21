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
    // Wrap the the UIImage constructor to use .module access
    //——————————————————————————————————————————————————————————————————————————————
    static func astroImage(_ named:String)->Image
    {
        return Image(named, bundle: .module)
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Astro Status symbols
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:Image {
        return astroImage("astro.off")
    }
    
    static var astroStatusStandby:Image {
        return astroImage("astro.standby")
    }
    
    static var astroStatusNormal:Image {
        return astroImage("astro.normal")
    }
    
    static var astroStatusCaution:Image {
        return astroImage("astro.caution")
    }
    
    static var astroStatusSerious:Image {
        return astroImage("astro.serious")
    }
    
    static var astroStatusCritical:Image {
        return astroImage("astro.critical")
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status symbol for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func imageForAstroStatus(_ status:AstroStatus)->Image
    {
        switch status {
        case .off:
            return astroStatusOff
        case .standby:
            return astroStatusStandby
        case .normal:
            return astroStatusNormal
        case .caution:
            return astroStatusCaution
        case .serious:
            return astroStatusSerious
        case .critical:
            return astroStatusCritical
        }
    }
}


// Extend UIImage to include many conveniece methods to access Astro Status symbols
#if os(iOS) || os(tvOS) || os(watchOS)
public extension UIImage
{
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the UIImage constructor to return a debug image instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    static func astroImage(named:String)->UIImage
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
    static var astroStatusOff:UIImage {
        return astroImage(named: "astro.off")
    }
    
    static var astroStatusStandby:UIImage {
        return astroImage(named:"astro.standby")
    }
    
    static var astroStatusNormal:UIImage {
        return astroImage(named:"astro.normal")
    }
    
    static var astroStatusCaution:UIImage {
        return astroImage(named:"astro.caution")
    }
    
    static var astroStatusSerious:UIImage {
        return astroImage(named:"astro.serious")
    }
    
    static var astroStatusCritical:UIImage {
        return astroImage(named:"astro.critical")
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status symbol for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func imageForAstroStatus(_ status:AstroStatus)->UIImage
    {
        switch status {
        case .off:
            return UIImage.astroStatusOff
        case .standby:
            return UIImage.astroStatusStandby
        case .normal:
            return UIImage.astroStatusNormal
        case .caution:
            return UIImage.astroStatusCaution
        case .serious:
            return UIImage.astroStatusSerious
        case .critical:
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
    static var astroStatusOff:NSImage {
        return astroImage(named: "astro.off")
    }
    
    static var astroStatusStandby:NSImage {
        return astroImage(named:"astro.standby")
    }
    
    static var astroStatusNormal:NSImage {
        return astroImage(named:"astro.normal")
    }
    
    static var astroStatusCaution:NSImage {
        return astroImage(named:"astro.caution")
    }
    
    static var astroStatusSerious:NSImage {
        return astroImage(named:"astro.serious")
    }
    
    static var astroStatusCritical:NSImage {
        return astroImage(named:"astro.critical")
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status symbol for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func imageForAstroStatus(_ status:AstroStatus)->NSImage
    {
        switch status {
        case .off:
            return NSImage.astroStatusOff
        case .standby:
            return NSImage.astroStatusStandby
        case .normal:
            return NSImage.astroStatusNormal
        case .caution:
            return NSImage.astroStatusCaution
        case .serious:
            return NSImage.astroStatusSerious
        case .critical:
            return NSImage.astroStatusCritical
        }
    }
}
#endif
