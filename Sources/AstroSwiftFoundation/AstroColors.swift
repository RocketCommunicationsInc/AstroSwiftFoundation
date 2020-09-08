//
//  AstroColors.swift 
//
//  Created by rocketjeff.
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

// Extend UIColor to include many conveniece methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
#if os(iOS) || os(tvOS) || os(watchOS)
extension UIColor
{
    //MARK: colorDebugging
    // If an Astro color fails to load from resources, show this noticeable brown debug color instead
    private static var astroDebugColor = UIColor.brown
    
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the UIColor constructor to return a debug color instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(named:String)->UIColor
    {
        return UIColor(named:named) ?? astroDebugColor
    }
    
    
    //MARK: Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro semantic UI colors
    //——————————————————————————————————————————————————————————————————————————————
    public static var astroUIBar:UIColor
    {return astroColor(named:"Astro UI Bar Color")} // astroUIQuaternaryLighten3,astroUITertiaryDarken3

    public static var astroUITint:UIColor
    {return astroColor(named:"Astro UI Tint Color")} //astroUISecondary

    public static var astroUITableCell:UIColor
    {return astroColor(named:"Astro UI Table Cell Color")} // white, astroUITertiaryDarken1
    
    public static var astroUITableCellLabel:UIColor
    {return astroColor(named:"Astro UI Table Cell Label Color")} // astroUIQuaternaryDarken4, white

    public static var astroUITableSelectedCell:UIColor
    {return astroColor(named:"Astro UI Table Selected Cell Color")} // astroUIPrimary, astroUIQuaternaryLighten3

    public static var astroUITableSeparator:UIColor
    {return astroColor(named:"Astro UI Table Separator Color")} // astroUIQuaternary, astroUITertiaryDarken2

    public static var astroUIBackground:UIColor
    {return astroColor(named:"Astro UI Background Color")} //astroUIQuaternaryLighten3, astroUITertiaryDarken1

    
    //MARK: Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    public static var astroStatusOff:UIColor
    {  return astroColor(named:"astroStatusOffColor")}
    
    public static var astroStatusStandby:UIColor
    { return astroColor(named:"astroStatusStandbyColor")}

    public static var astroStatusNormal:UIColor
    { return astroColor(named:"astroStatusNormalColor")}
    
    public static var astroStatusCaution:UIColor
    { return astroColor(named:"astroStatusCautionColor")}
    
    public static var astroStatusSerious:UIColor
    { return astroColor(named:"astroStatusSeriousColor")}
    
    public static var astroStatusCritical:UIColor
    { return astroColor(named:"astroStatusCriticalColor")}
    

    //MARK: Astro Color Convenience Functions
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    public static func colorForAstroStatus(_ status:AstroStatus)->UIColor
    {
        switch status {
        case .Off:
            return UIColor.astroStatusOff
        case .Standby:
            return UIColor.astroStatusStandby
        case .Normal:
            return UIColor.astroStatusNormal
        case .Caution:
            return UIColor.astroStatusCaution
        case .Serious:
            return UIColor.astroStatusSerious
        case .Critical:
            return UIColor.astroStatusCritical
        }
    }
    

    //——————————————————————————————————————————————————————————————————————————————
    // Return a random Astro status color.
    // Useful for debugging or demo.
    //——————————————————————————————————————————————————————————————————————————————
    public static func randomStatusColor()->UIColor
    {
        switch AstroStatus.randomStatus()
        {
        case .Off:
            return UIColor.astroStatusOff
        case .Standby:
            return UIColor.astroStatusStandby
        case .Normal:
            return UIColor.astroStatusNormal
        case .Caution:
            return UIColor.astroStatusCaution
        case .Serious:
            return UIColor.astroStatusSerious
        case .Critical:
            return UIColor.astroStatusCritical
        }
    }
}

#endif

#if os(macOS)
extension NSColor
{
    //MARK: colorDebugging
    // If an Astro color fails to load from resources, show this noticeable brown debug color instead
    private static var astroDebugColor = NSColor.brown
    
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the NSColor constructor to return a debug color instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(named:String)->NSColor
    {
        return NSColor(named:named) ?? astroDebugColor
    }
    
    
    //MARK: Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro semantic UI colors
    //——————————————————————————————————————————————————————————————————————————————
    public static var astroUIBar:NSColor
    {return astroColor(named:"Astro UI Bar Color")} // astroUIQuaternaryLighten3,astroUITertiaryDarken3

    public static var astroUITint:NSColor
    {return astroColor(named:"Astro UI Tint Color")} //astroUISecondary

    public static var astroUITableCell:NSColor
    {return astroColor(named:"Astro UI Table Cell Color")} // white, astroUITertiaryDarken1
    
    public static var astroUITableCellLabel:NSColor
    {return astroColor(named:"Astro UI Table Cell Label Color")} // astroUIQuaternaryDarken4, white

    public static var astroUITableSelectedCell:NSColor
    {return astroColor(named:"Astro UI Table Selected Cell Color")} // astroUIPrimary, astroUIQuaternaryLighten3

    public static var astroUITableSeparator:NSColor
    {return astroColor(named:"Astro UI Table Separator Color")} // astroUIQuaternary, astroUITertiaryDarken2

    public static var astroUIBackground:NSColor
    {return astroColor(named:"Astro UI Background Color")} //astroUIQuaternaryLighten3, astroUITertiaryDarken1

    
    //MARK: Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    public static var astroStatusOff:NSColor
    {  return astroColor(named:"astroStatusOffColor")}
    
    public static var astroStatusStandby:NSColor
    { return astroColor(named:"astroStatusStandbyColor")}

    public static var astroStatusNormal:NSColor
    { return astroColor(named:"astroStatusNormalColor")}
    
    public static var astroStatusCaution:NSColor
    { return astroColor(named:"astroStatusCautionColor")}
    
    public static var astroStatusSerious:NSColor
    { return astroColor(named:"astroStatusSeriousColor")}
    
    public static var astroStatusCritical:NSColor
    { return astroColor(named:"astroStatusCriticalColor")}
    

    //MARK: Astro Color Convenience Functions
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    public static func colorForAstroStatus(_ status:AstroStatus)->NSColor
    {
        switch status {
        case .Off:
            return NSColor.astroStatusOff
        case .Standby:
            return NSColor.astroStatusStandby
        case .Normal:
            return NSColor.astroStatusNormal
        case .Caution:
            return NSColor.astroStatusCaution
        case .Serious:
            return NSColor.astroStatusSerious
        case .Critical:
            return NSColor.astroStatusCritical
        }
    }
    

    //——————————————————————————————————————————————————————————————————————————————
    // Return a random Astro status color.
    // Useful for debugging or demo.
    //——————————————————————————————————————————————————————————————————————————————
    public static func randomStatusColor()->NSColor
    {
        switch AstroStatus.randomStatus()
        {
        case .Off:
            return NSColor.astroStatusOff
        case .Standby:
            return NSColor.astroStatusStandby
        case .Normal:
            return NSColor.astroStatusNormal
        case .Caution:
            return NSColor.astroStatusCaution
        case .Serious:
            return NSColor.astroStatusSerious
        case .Critical:
            return NSColor.astroStatusCritical
        }
    }

}
#endif

