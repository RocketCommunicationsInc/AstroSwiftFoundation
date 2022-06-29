//
//  AstroColors.swift
//
//  Created by rocketjeff.
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
    // Wrap the the Color constructor for a convenient debug breakpoint
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(_ named:String)->Color
    {
        // The Color constructor is non-failable, so no debug color.
        // If the color fails to load, it is set to white, without an error
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
    static var astroUIBackground:Color { return astroColor("Astro UI Background")}
    static var astroUISecondaryBackground:Color { return astroColor("Astro UI Secondary Background")}
    static var astroUITertiaryBackground:Color { return astroColor("Astro UI Tertiary Background")}

    /* 2. systemGroupedBackground
     *    Use this stack for views with grouped content, such as grouped tables and
     *    platter-based designs. These are like grouped table views, but you may use these
     *    colors in places where a table view wouldn't make sense.
     */
    static var astroUIGroupedBackground:Color { return astroColor("Astro UI Grouped Background")}
    static var astroUISecondaryGroupedBackground:Color { return astroColor("Astro UI Secondary Grouped Background")}
    static var astroUITertiaryGroupedBackground:Color { return astroColor("Astro UI Tertiary Grouped Background")}

    // Accent color is applied to all controls, also used for Tint
    static var astroUIAccent:Color { return astroColor("Astro UI Accent")}

    //MARK: Color - OBSOLETE Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro OBSOLETE UI colors
    //——————————————————————————————————————————————————————————————————————————————
    @available(*, unavailable, message: "Setting Astro colors on Bars is no longer recommended")
    static var astroUIBar:Color
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "astroUIAccent")
    static var astroUITint:Color
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "astroUIBackground")
    static var astroUITableCell:Color
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "label")
    static var astroUITableCellLabel:Color
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, message: "Setting Astro colors on Cell Selection is no longer recommended")
    static var astroUITableSelectedCell:Color
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, message: "Setting Astro colors on Table Separator is no longer recommended")
    static var astroUITableSeparator:Color
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    
    //MARK: Color - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:Color
    {  return astroColor("Astro Status Off")}
    
    static var astroStatusStandby:Color
    { return astroColor("Astro Status Standby")}

    static var astroStatusNormal:Color
    { return astroColor("Astro Status Normal")}
    
    static var astroStatusCaution:Color
    { return astroColor("Astro Status Caution")}
    
    static var astroStatusSerious:Color
    { return astroColor("Astro Status Serious")}
    
    static var astroStatusCritical:Color
    { return astroColor("Astro Status Critical")}
    

    //MARK: Color - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:Color
    {  return astroColor("Astro Classification Unclassified")}
    
    static var astroClassificationCUI:Color
    { return astroColor("Astro Classification Cui")}

    static var astroClassificationConfidential:Color
    { return astroColor("Astro Classification Confidential")}
    
    static var astroClassificationSecret:Color
    { return astroColor("Astro Classification Secret")}
    
    static var astroClassificationTopSecret:Color
    { return astroColor("Astro Classification Topsecret")}
    
    static var astroClassificationTopSecretSCI:Color
    { return astroColor("Astro Classification Topsecretsci")}
    


    //MARK: Color - Astro Color Convenience Functions
    @available(*, unavailable, message: "Use AstroStatus.color")
    static func colorForAstroStatus(_ status:AstroStatus)->Color
    {return astroColor("Unavailable")} // will never run, here for compiler demands
    
    @available(*, unavailable, message: "Use AstroStatus.randomStatus().color")
    static func randomStatusColor()->Color
    {return astroColor("Unavailable")} // will never run, here for compiler demands
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
    static var astroUIBackground:UIColor { return astroColor("Astro UI Background")}
    static var astroUISecondaryBackground:UIColor { return astroColor("Astro UI Secondary Background")}
    static var astroUITertiaryBackground:UIColor { return astroColor("Astro UI Tertiary Background")}

    /* 2. systemGroupedBackground
     *    Use this stack for views with grouped content, such as grouped tables and
     *    platter-based designs. These are like grouped table views, but you may use these
     *    colors in places where a table view wouldn't make sense.
     */
    static var astroUIGroupedBackground:UIColor { return astroColor("Astro UI Grouped Background")}
    static var astroUISecondaryGroupedBackground:UIColor { return astroColor("Astro UI Secondary Grouped Background")}
    static var astroUITertiaryGroupedBackground:UIColor { return astroColor("Astro UI Tertiary Grouped Background")}

    // Accent color is applied to all controls, also used for Tint
    static var astroUIAccent:UIColor { return astroColor("Astro UI Accent")}

    
    //MARK: UIColor - OBSOLETE Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro OBSOLETE UI colors
    //——————————————————————————————————————————————————————————————————————————————
    @available(*, unavailable, message: "Setting Astro colors on Bars is no longer recommended")
    static var astroUIBar:UIColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "astroUIAccent")
    static var astroUITint:UIColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "astroUIBackground")
    static var astroUITableCell:UIColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "label")
    static var astroUITableCellLabel:UIColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, message: "Setting Astro colors on Cell Selection is no longer recommended")
    static var astroUITableSelectedCell:UIColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, message: "Setting Astro colors on Table Separator is no longer recommended")
    static var astroUITableSeparator:UIColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    
    //MARK: UIColor - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:UIColor
    {  return astroColor("Astro Status Off")}
    
    static var astroStatusStandby:UIColor
    { return astroColor("Astro Status Standby")}

    static var astroStatusNormal:UIColor
    { return astroColor("Astro Status Normal")}
    
    static var astroStatusCaution:UIColor
    { return astroColor("Astro Status Caution")}
    
    static var astroStatusSerious:UIColor
    { return astroColor("Astro Status Serious")}
    
    static var astroStatusCritical:UIColor
    { return astroColor("Astro Status Critical")}
    

    //MARK: UIColor - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:UIColor
    {  return astroColor("Astro Classification Unclassified")}
    
    static var astroClassificationCUI:UIColor
    { return astroColor("Astro Classification Cui")}

    static var astroClassificationConfidential:UIColor
    { return astroColor("Astro Classification Confidential")}
    
    static var astroClassificationSecret:UIColor
    { return astroColor("Astro Classification Secret")}
    
    static var astroClassificationTopSecret:UIColor
    { return astroColor("Astro Classification Topsecret")}
    
    static var astroClassificationTopSecretSCI:UIColor
    { return astroColor("Astro Classification Topsecretsci")}

    

    //MARK: UIColor - Astro Color Convenience Functions
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func colorForAstroStatus(_ status:AstroStatus)->UIColor
    {
        switch status {
        case .off:
            return UIColor.astroStatusOff
        case .standby:
            return UIColor.astroStatusStandby
        case .normal:
            return UIColor.astroStatusNormal
        case .caution:
            return UIColor.astroStatusCaution
        case .serious:
            return UIColor.astroStatusSerious
        case .critical:
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
    
    //MARK: NSColor - New (2.0) Astro Semantic colors
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
    static var astroUIBackground:NSColor { return astroColor("Astro UI Background")}
    static var astroUISecondaryBackground:NSColor { return astroColor("Astro UI Secondary Background")}
    static var astroUITertiaryBackground:NSColor { return astroColor("Astro UI Tertiary Background")}

    /* 2. systemGroupedBackground
     *    Use this stack for views with grouped content, such as grouped tables and
     *    platter-based designs. These are like grouped table views, but you may use these
     *    colors in places where a table view wouldn't make sense.
     */
    static var astroUIGroupedBackground:NSColor { return astroColor("Astro UI Grouped Background")}
    static var astroUISecondaryGroupedBackground:NSColor { return astroColor("Astro UI Secondary Grouped Background")}
    static var astroUITertiaryGroupedBackground:NSColor { return astroColor("Astro UI Tertiary Grouped Background")}

    // Accent color is applied to all controls, also used for Tint
    static var astroUIAccent:NSColor { return astroColor("Astro UI Accent")}
    
    //MARK: NSColor - OBSOLETE Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro OBSOLETE UI colors
    //——————————————————————————————————————————————————————————————————————————————
    @available(*, unavailable, message: "Setting Astro colors on Bars is no longer recommended")
    static var astroUIBar:NSColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "astroUIAccent")
    static var astroUITint:NSColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "astroUIBackground")
    static var astroUITableCell:NSColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "label")
    static var astroUITableCellLabel:NSColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, message: "Setting Astro colors on Cell Selection is no longer recommended")
    static var astroUITableSelectedCell:NSColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, message: "Setting Astro colors on Table Separator is no longer recommended")
    static var astroUITableSeparator:NSColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands


    
    //MARK: NSColor - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:NSColor
    {  return astroColor("Astro Status Off")}
    
    static var astroStatusStandby:NSColor
    { return astroColor("Astro Status Standby")}

    static var astroStatusNormal:NSColor
    { return astroColor("Astro Status Normal")}
    
    static var astroStatusCaution:NSColor
    { return astroColor("Astro Status Caution")}
    
    static var astroStatusSerious:NSColor
    { return astroColor("Astro Status Serious")}
    
    static var astroStatusCritical:NSColor
    { return astroColor("Astro Status Critical")}
    
    
    //MARK: NSColor - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:NSColor
    {  return astroColor("Astro Classification Unclassified")}
    
    static var astroClassificationCUI:NSColor
    { return astroColor("Astro Classification Cui")}

    static var astroClassificationConfidential:NSColor
    { return astroColor("Astro Classification Confidential")}
    
    static var astroClassificationSecret:NSColor
    { return astroColor("Astro Classification Secret")}
    
    static var astroClassificationTopSecret:NSColor
    { return astroColor("Astro Classification Topsecret")}
    
    static var astroClassificationTopSecretSCI:NSColor
    { return astroColor("Astro Classification Topsecretsci")}

    
    //MARK: NSColor - Astro Color Convenience Functions
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func colorForAstroStatus(_ status:AstroStatus)->NSColor
    {
        switch status {
        case .off:
            return NSColor.astroStatusOff
        case .standby:
            return NSColor.astroStatusStandby
        case .normal:
            return NSColor.astroStatusNormal
        case .caution:
            return NSColor.astroStatusCaution
        case .serious:
            return NSColor.astroStatusSerious
        case .critical:
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

