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

// Extend Color, for SwiftUI, to include many convenience methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
public extension Color
{

    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the Color constructor
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(_ named:String)->Color
    {
        // The Color constructor is non-failable, so no debug color
        return Color(named, bundle: .module)
    }
    

    //MARK: Color - New (2.0) Astro Semantic colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro semantic UI colors
    //——————————————————————————————————————————————————————————————————————————————
        
    /* Apple defines two systems (also known as "stacks") for structuring an iOS app's backgrounds.
     * Astro offers these alternative background colors to give an Astro look in Dark mode
     *
     * Each stack has three "levels" of background colors. The first color is intended to be the
     * main background, farthest back. Secondary and tertiary colors are layered on top
     * of the main background, when appropriate.
     *
     * Inside of a discrete piece of UI, choose a stack, then use colors from that stack.
     * We do not recommend mixing and matching background colors between stacks.
     * The foreground colors above are designed to work in both stacks.
     *
     * 1. systemBackground
     *    Use this stack for views with standard table views, and designs which have a white
     *    primary background in light mode.
     */
    static var astroUIBackground:Color { return astroColor("Astro UI Background Color")}
    static var astroUISecondaryBackground:Color { return astroColor("Astro UI Secondary Background Color")}
    static var astroUITertiaryBackground:Color { return astroColor("Astro UI Tertiary Background Color")}

    /* 2. systemGroupedBackground
     *    Use this stack for views with grouped content, such as grouped tables and
     *    platter-based designs. These are like grouped table views, but you may use these
     *    colors in places where a table view wouldn't make sense.
     */
    static var astroUIGroupedBackground:Color { return astroColor("Astro UI Grouped Background Color")}
    static var astroUISecondaryGroupedBackground:Color { return astroColor("Astro UI Secondary Grouped Background Color")}
    static var astroUITertiaryGroupedBackground:Color { return astroColor("Astro UI Tertiary Grouped Background Color")}

    // Accent color is applied to all controls, also used for Tint
    static var astroUIAccent:Color { return astroColor("Astro UI Accent Color")}

    @available(*, deprecated , message:"Applying color to Bars is no longer recommented")
    static var astroUIBar:Color = .red
//    {return astroColor("Astro UI Bar Color")} // astroUIQuaternaryLighten3,astroUITertiaryDarken3

    @available(*, deprecated , renamed:"astroUIAccent")
    static var astroUITint:Color = .red
 //   {return astroColor("Astro UI Tint Color")} //astroUISecondary

    static var astroUITableCell:Color
    {return astroColor("Astro UI Table Cell Color")} // white, astroUITertiaryDarken1
    
    static var astroUITableCellLabel:Color
    {return astroColor("Astro UI Table Cell Label Color")} // astroUIQuaternaryDarken4, white

    static var astroUITableSelectedCell:Color
    {return astroColor("Astro UI Table Selected Cell Color")} // astroUIPrimary, astroUIQuaternaryLighten3

    static var astroUITableSeparator:Color
    {return astroColor("Astro UI Table Separator Color")} // astroUIQuaternary, astroUITertiaryDarken2

//    static var astroUIBackground:Color
//    {return astroColor("Astro UI Background Color")} //astroUIQuaternaryLighten3, astroUITertiaryDarken1
    
    
    //MARK: Color - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:Color
    {  return astroColor("Astro Status Off Color")}
    
    static var astroStatusStandby:Color
    { return astroColor("Astro Status Standby Color")}

    static var astroStatusNormal:Color
    { return astroColor("Astro Status Normal Color")}
    
    static var astroStatusCaution:Color
    { return astroColor("Astro Status Caution Color")}
    
    static var astroStatusSerious:Color
    { return astroColor("Astro Status Serious Color")}
    
    static var astroStatusCritical:Color
    { return astroColor("Astro Status Critical Color")}
    

    //MARK: Color - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:Color
    {  return astroColor("Astro Classification Unclassified Color")}
    
    static var astroClassificationCUI:Color
    { return astroColor("Astro Classification CUI Color")}

    static var astroClassificationConfidential:Color
    { return astroColor("Astro Classification Confidential Color")}
    
    static var astroClassificationSecret:Color
    { return astroColor("Astro Classification Secret Color")}
    
    static var astroClassificationTopSecret:Color
    { return astroColor("Astro Classification Top Secret Color")}
    
    static var astroClassificationTopSecretSCI:Color
    { return astroColor("Astro Classification Top Secret SCI Color")}
    
   
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


// Extend UIColor, for iOS, tvOS, an watchOS, to include many convenience methods to access the Astro UI and Status colors
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
    private static func astroColor(_ named:String)->UIColor
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
    {return astroColor("Astro UI Bar Color")} // astroUIQuaternaryLighten3,astroUITertiaryDarken3

    static var astroUITint:UIColor
    {return astroColor("Astro UI Tint Color")} //astroUISecondary

    static var astroUITableCell:UIColor
    {return astroColor("Astro UI Table Cell Color")} // white, astroUITertiaryDarken1
    
    static var astroUITableCellLabel:UIColor
    {return astroColor("Astro UI Table Cell Label Color")} // astroUIQuaternaryDarken4, white

    static var astroUITableSelectedCell:UIColor
    {return astroColor("Astro UI Table Selected Cell Color")} // astroUIPrimary, astroUIQuaternaryLighten3

    static var astroUITableSeparator:UIColor
    {return astroColor("Astro UI Table Separator Color")} // astroUIQuaternary, astroUITertiaryDarken2

    static var astroUIBackground:UIColor
    {return astroColor("Astro UI Background Color")} //astroUIQuaternaryLighten3, astroUITertiaryDarken1

    
    //MARK: UIColor - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:UIColor
    {  return astroColor("Astro Status Off Color")}
    
    static var astroStatusStandby:UIColor
    { return astroColor("Astro Status Standby Color")}

    static var astroStatusNormal:UIColor
    { return astroColor("Astro Status Normal Color")}
    
    static var astroStatusCaution:UIColor
    { return astroColor("Astro Status Caution Color")}
    
    static var astroStatusSerious:UIColor
    { return astroColor("Astro Status Serious Color")}
    
    static var astroStatusCritical:UIColor
    { return astroColor("Astro Status Critical Color")}
    

    //MARK: UIColor - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:UIColor
    {  return astroColor("Astro Classification Unclassified Color")}
    
    static var astroClassificationCUI:UIColor
    { return astroColor("Astro Classification CUI Color")}

    static var astroClassificationConfidential:UIColor
    { return astroColor("Astro Classification Confidential Color")}
    
    static var astroClassificationSecret:UIColor
    { return astroColor("Astro Classification Secret Color")}
    
    static var astroClassificationTopSecret:UIColor
    { return astroColor("Astro Classification Top Secret Color")}
    
    static var astroClassificationTopSecretSCI:UIColor
    { return astroColor("Astro Classification Top Secret SCI Color")}

    

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
// Extend NSColor, for macOS, to include many convenience methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
public extension NSColor
{
    // If an Astro color fails to load from resources, show this noticeable brown debug color instead
    private static var astroDebugColor = NSColor.brown
    
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the NSColor constructor to return a debug color instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(_ named:String)->NSColor
    {
        return NSColor(named:named) ?? astroDebugColor
    }
    
    
    //MARK: NSColor - Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro semantic UI colors
    //——————————————————————————————————————————————————————————————————————————————
    @available(*, deprecated, message:"Dont colorize bars")
    static var astroUIBar:NSColor
//    {return astroColor("Astro UI Bar Color")} // astroUIQuaternaryLighten3,astroUITertiaryDarken3

    static var astroUITint:NSColor
//  {return astroColor("Astro UI Tint Color")} //astroUISecondary

    static var astroUITableCell:NSColor
    {return astroColor("Astro UI Table Cell Color")} // white, astroUITertiaryDarken1
    
    static var astroUITableCellLabel:NSColor
    {return astroColor("Astro UI Table Cell Label Color")} // astroUIQuaternaryDarken4, white

    static var astroUITableSelectedCell:NSColor
    {return astroColor("Astro UI Table Selected Cell Color")} // astroUIPrimary, astroUIQuaternaryLighten3

    static var astroUITableSeparator:NSColor
    {return astroColor("Astro UI Table Separator Color")} // astroUIQuaternary, astroUITertiaryDarken2

    static var astroUIBackground:NSColor
    {return astroColor("Astro UI Background Color")} //astroUIQuaternaryLighten3, astroUITertiaryDarken1

    
    //MARK: NSColor - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:NSColor
    {  return astroColor("Astro Status Off Color")}
    
    static var astroStatusStandby:NSColor
    { return astroColor("Astro Status Standby Color")}

    static var astroStatusNormal:NSColor
    { return astroColor("Astro Status Normal Color")}
    
    static var astroStatusCaution:NSColor
    { return astroColor("Astro Status Caution Color")}
    
    static var astroStatusSerious:NSColor
    { return astroColor("Astro Status Serious Color")}
    
    static var astroStatusCritical:NSColor
    { return astroColor("Astro Status Critical Color")}
    
    
    //MARK: NSColor - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:NSColor
    {  return astroColor("Astro Classification Unclassified Color")}
    
    static var astroClassificationCUI:NSColor
    { return astroColor("Astro Classification CUI Color")}

    static var astroClassificationConfidential:NSColor
    { return astroColor("Astro Classification Confidential Color")}
    
    static var astroClassificationSecret:NSColor
    { return astroColor("Astro Classification Secret Color")}
    
    static var astroClassificationTopSecret:NSColor
    { return astroColor("Astro Classification Top Secret Color")}
    
    static var astroClassificationTopSecretSCI:NSColor
    { return astroColor("Astro Classification Top Secret SCI Color")}

    
    //MARK: NSColor - Astro Color Convenience Functions
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func colorForAstroStatus(_ status:AstroStatus)->NSColor
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
    static func randomStatusColor()->NSColor
    {
        return colorForAstroStatus(AstroStatus.randomStatus())
    }

}
#endif

