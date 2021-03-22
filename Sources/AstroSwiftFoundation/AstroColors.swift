//
//  AstroColors.swift
//
//  Created by rocketjeff.
//  Copyright © 2019-2021 Rocket Communications, Inc. All rights reserved.
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

// Extend Color, for SwiftUI, to include many conveniece methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
public extension Color
{
    //MARK: Color - Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro semantic UI colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroUIBar:Color
    {return Color("Astro UI Bar Color")} // astroUIQuaternaryLighten3,astroUITertiaryDarken3

    static var astroUITint:Color
    {return Color("Astro UI Tint Color")} //astroUISecondary

    static var astroUITableCell:Color
    {return Color("Astro UI Table Cell Color")} // white, astroUITertiaryDarken1
    
    static var astroUITableCellLabel:Color
    {return Color("Astro UI Table Cell Label Color")} // astroUIQuaternaryDarken4, white

    static var astroUITableSelectedCell:Color
    {return Color("Astro UI Table Selected Cell Color")} // astroUIPrimary, astroUIQuaternaryLighten3

    static var astroUITableSeparator:Color
    {return Color("Astro UI Table Separator Color")} // astroUIQuaternary, astroUITertiaryDarken2

    static var astroUIBackground:Color
    {return Color("Astro UI Background Color")} //astroUIQuaternaryLighten3, astroUITertiaryDarken1
    
    //MARK: Color - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:Color
    {  return Color("Astro Status Off Color")}
    
    static var astroStatusStandby:Color
    { return Color("Astro Status Standby Color")}

    static var astroStatusNormal:Color
    { return Color("Astro Status Normal Color")}
    
    static var astroStatusCaution:Color
    { return Color("Astro Status Caution Color")}
    
    static var astroStatusSerious:Color
    { return Color("Astro Status Serious Color")}
    
    static var astroStatusCritical:Color
    { return Color("Astro Status Critical Color")}
    

    //MARK: Color - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:Color
    {  return Color("Astro Classification Unclassified Color")}
    
    static var astroClassificationCUI:Color
    { return Color("Astro Classification CUI Color")}

    static var astroClassificationConfidential:Color
    { return Color("Astro Classification Confidential Color")}
    
    static var astroClassificationSecret:Color
    { return Color("Astro Classification Secret Color")}
    
    static var astroClassificationTopSecret:Color
    { return Color("Astro Classification Top Secret Color")}
    
    static var astroClassificationTopSecretSCI:Color
    { return Color("Astro Classification Top Secret SCI Color")}
    
   
    //MARK: Color - Astro Color Convenience Functions
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func colorForAstroStatus(_ status:AstroStatus)->Color
    {
        switch status {
        case .Off:
            return Color.astroStatusOff
        case .Standby:
            return Color.astroStatusStandby
        case .Normal:
            return Color.astroStatusNormal
        case .Caution:
            return Color.astroStatusCaution
        case .Serious:
            return Color.astroStatusSerious
        case .Critical:
            return Color.astroStatusCritical
        }
    }
    

    //——————————————————————————————————————————————————————————————————————————————
    // Return a random Astro status color.
    // Useful for debugging or demo.
    //——————————————————————————————————————————————————————————————————————————————
    static func randomStatusColor()->Color
    {
        return colorForAstroStatus(AstroStatus.randomStatus())
    }
}


// Extend UIColor, for iOS, tvOS, an watchOS, to include many conveniece methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
#if os(iOS) || os(tvOS) || os(watchOS)
public extension UIColor
{
    // If an Astro color fails to load from resources, show this noticeable brown debug color instead
    private static var astroDebugColor = UIColor.brown
    
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the UIColor constructor to return a debug color instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(named:String)->UIColor
    {
        #if os(iOS) || os(tvOS)
        return UIColor(named:named, in: .module, compatibleWith: nil) ?? astroDebugColor
        #endif
        
        #if os(watchOS)
        return UIColor(named:named) ?? astroDebugColor
        #endif
    }
    
    
    //MARK: UIColor - Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro semantic UI colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroUIBar:UIColor
    {return astroColor(named:"Astro UI Bar Color")} // astroUIQuaternaryLighten3,astroUITertiaryDarken3

    static var astroUITint:UIColor
    {return astroColor(named:"Astro UI Tint Color")} //astroUISecondary

    static var astroUITableCell:UIColor
    {return astroColor(named:"Astro UI Table Cell Color")} // white, astroUITertiaryDarken1
    
    static var astroUITableCellLabel:UIColor
    {return astroColor(named:"Astro UI Table Cell Label Color")} // astroUIQuaternaryDarken4, white

    static var astroUITableSelectedCell:UIColor
    {return astroColor(named:"Astro UI Table Selected Cell Color")} // astroUIPrimary, astroUIQuaternaryLighten3

    static var astroUITableSeparator:UIColor
    {return astroColor(named:"Astro UI Table Separator Color")} // astroUIQuaternary, astroUITertiaryDarken2

    static var astroUIBackground:UIColor
    {return astroColor(named:"Astro UI Background Color")} //astroUIQuaternaryLighten3, astroUITertiaryDarken1

    
    //MARK: UIColor - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:UIColor
    {  return astroColor(named:"Astro Status Off Color")}
    
    static var astroStatusStandby:UIColor
    { return astroColor(named:"Astro Status Standby Color")}

    static var astroStatusNormal:UIColor
    { return astroColor(named:"Astro Status Normal Color")}
    
    static var astroStatusCaution:UIColor
    { return astroColor(named:"Astro Status Caution Color")}
    
    static var astroStatusSerious:UIColor
    { return astroColor(named:"Astro Status Serious Color")}
    
    static var astroStatusCritical:UIColor
    { return astroColor(named:"Astro Status Critical Color")}
    

    //MARK: UIColor - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:UIColor
    {  return astroColor(named:"Astro Classification Unclassified Color")}
    
    static var astroClassificationCUI:UIColor
    { return astroColor(named:"Astro Classification CUI Color")}

    static var astroClassificationConfidential:UIColor
    { return astroColor(named:"Astro Classification Confidential Color")}
    
    static var astroClassificationSecret:UIColor
    { return astroColor(named:"Astro Classification Secret Color")}
    
    static var astroClassificationTopSecret:UIColor
    { return astroColor(named:"Astro Classification Top Secret Color")}
    
    static var astroClassificationTopSecretSCI:UIColor
    { return astroColor(named:"Astro Classification Top Secret SCI Color")}

    

    //MARK: UIColor - Astro Color Convenience Functions
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func colorForAstroStatus(_ status:AstroStatus)->UIColor
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
    static func randomStatusColor()->UIColor
    {
        return colorForAstroStatus(AstroStatus.randomStatus())
    }
}

#endif

#if os(macOS)
// Extend NSColor, for macOS, to include many conveniece methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
extension NSColor
{
    // If an Astro color fails to load from resources, show this noticeable brown debug color instead
    private static var astroDebugColor = NSColor.brown
    
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the NSColor constructor to return a debug color instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(named:String)->NSColor
    {
        return NSColor(named:named) ?? astroDebugColor
    }
    
    
    //MARK: NSColor - Astro UI colors
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

    
    //MARK: NSColor - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    public static var astroStatusOff:NSColor
    {  return astroColor(named:"Astro Status Off Color")}
    
    public static var astroStatusStandby:NSColor
    { return astroColor(named:"Astro Status Standby Color")}

    public static var astroStatusNormal:NSColor
    { return astroColor(named:"Astro Status Normal Color")}
    
    public static var astroStatusCaution:NSColor
    { return astroColor(named:"Astro Status Caution Color")}
    
    public static var astroStatusSerious:NSColor
    { return astroColor(named:"Astro Status Serious Color")}
    
    public static var astroStatusCritical:NSColor
    { return astroColor(named:"Astro Status Critical Color")}
    
    
    //MARK: NSColor - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    public static var astroClassificationUnclassified:NSColor
    {  return astroColor(named:"Astro Classification Unclassified Color")}
    
    public static var astroClassificationCUI:NSColor
    { return astroColor(named:"Astro Classification CUI Color")}

    public static var astroClassificationConfidential:NSColor
    { return astroColor(named:"Astro Classification Confidential Color")}
    
    public static var astroClassificationSecret:NSColor
    { return astroColor(named:"Astro Classification Secret Color")}
    
    public static var astroClassificationTopSecret:NSColor
    { return astroColor(named:"Astro Classification Top Secret Color")}
    
    public static var astroClassificationTopSecretSCI:NSColor
    { return astroColor(named:"Astro Classification Top Secret SCI Color")}

    
    //MARK: NSColor - Astro Color Convenience Functions
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
        return colorForAstroStatus(AstroStatus.randomStatus())
    }

}
#endif

