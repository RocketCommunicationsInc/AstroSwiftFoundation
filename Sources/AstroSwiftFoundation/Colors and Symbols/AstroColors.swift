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

// UIColor and NSColor are similar enough that a typealias allows us to use
// the same code for both class extensions
#if canImport(UIKit)
public typealias NativeColor = UIColor
#elseif canImport(AppKit)
public typealias NativeColor = NSColor
#endif

// Extend Color for SwiftUI, to include many convenience methods to access Semantic UI, Status, and Classification colors.
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
public extension Color
{
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the Color constructor for a convenient debug breakpoint
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(_ named:String)->Color
    {
        // The Color constructor is non-failable, so no debug color.
        // If the color fails to load it is set to white, without an error
        return Color(named, bundle: .module)
    }
    

    //MARK: Color - New (2.0) Astro Semantic colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro semantic UI colors
    //——————————————————————————————————————————————————————————————————————————————
        
    /* Apple defines two systems (also known as "stacks") for structuring an iOS app's backgrounds.
     * Astro offers these alternative background colors to give an Astro look in Light and Dark mode
     *
     * Each stack has three "levels" of background colors. The first color is intended to be the
     * main background, farthest back. Secondary and tertiary colors are layered on top
     * of the main background, when appropriate.
     *
     *
     * 1. astroUIBackground
     *    Use this stack for views with standard table views, and designs which have a white
     *    primary background in light mode.
     */
    static var astroUIBackground:Color { return astroColor("Astro UI Background")}
    static var astroUISecondaryBackground:Color { return astroColor("Astro UI Secondary Background")}
    static var astroUITertiaryBackground:Color { return astroColor("Astro UI Tertiary Background")}

    /* 2. astroUIGroupedBackground
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


// Extend UIColor or NSColor to include many convenience methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
public extension NativeColor
{
    // If an Astro color fails to load from resources, show this noticeable brown debug color instead
    private static var astroDebugColor = NativeColor.brown
    
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the UIColor constructor to return a debug color instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(_ named:String)->NativeColor
    {
        #if os(iOS) || os(tvOS)
        return NativeColor(named:named, in: .module, compatibleWith: nil) ?? astroDebugColor
        #endif
        
        #if os(watchOS) || os(macOS)
        return NativeColor(named:named) ?? astroDebugColor
        #endif
    }
    
    
    //MARK: Color - New (2.0) Astro Semantic colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro semantic UI colors
    //——————————————————————————————————————————————————————————————————————————————
     
    /* Apple defines two systems (also known as "stacks") for structuring an iOS app's backgrounds.
     * Astro offers these alternative background colors to give an Astro look in Light and Dark mode
     *
     * Each stack has three "levels" of background colors. The first color is intended to be the
     * main background, farthest back. Secondary and tertiary colors are layered on top
     * of the main background, when appropriate.
     *
     * 1. astroUIBackground
     *    Use this stack for views with standard table views, and designs which have a white
     *    primary background in light mode.
     */
    static var astroUIBackground:NativeColor { return astroColor("Astro UI Background")}
    static var astroUISecondaryBackground:NativeColor { return astroColor("Astro UI Secondary Background")}
    static var astroUITertiaryBackground:NativeColor { return astroColor("Astro UI Tertiary Background")}

    /* 2. astroUIGroupedBackground
     *    Use this stack for views with grouped content, such as grouped tables and
     *    platter-based designs. These are like grouped table views, but you may use these
     *    colors in places where a table view wouldn't make sense.
     */
    static var astroUIGroupedBackground:NativeColor { return astroColor("Astro UI Grouped Background")}
    static var astroUISecondaryGroupedBackground:NativeColor { return astroColor("Astro UI Secondary Grouped Background")}
    static var astroUITertiaryGroupedBackground:NativeColor { return astroColor("Astro UI Tertiary Grouped Background")}

    // Accent color is applied to all controls, also used for Tint
    static var astroUIAccent:NativeColor { return astroColor("Astro UI Accent")}

    
    //MARK: UIColor - OBSOLETE Astro UI colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro OBSOLETE UI colors
    //——————————————————————————————————————————————————————————————————————————————
    @available(*, unavailable, message: "Setting Astro colors on Bars is no longer recommended")
    static var astroUIBar:NativeColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "astroUIAccent")
    static var astroUITint:NativeColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "astroUIBackground")
    static var astroUITableCell:NativeColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, renamed: "label")
    static var astroUITableCellLabel:NativeColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, message: "Setting Astro colors on Cell Selection is no longer recommended")
    static var astroUITableSelectedCell:NativeColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    @available(*, unavailable, message: "Setting Astro colors on Table Separator is no longer recommended")
    static var astroUITableSeparator:NativeColor
    {return astroColor("Unavailable")} // will never run, here for compiler demands

    
    //MARK: UIColor - Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:NativeColor
    {  return astroColor("Astro Status Off")}
    
    static var astroStatusStandby:NativeColor
    { return astroColor("Astro Status Standby")}

    static var astroStatusNormal:NativeColor
    { return astroColor("Astro Status Normal")}
    
    static var astroStatusCaution:NativeColor
    { return astroColor("Astro Status Caution")}
    
    static var astroStatusSerious:NativeColor
    { return astroColor("Astro Status Serious")}
    
    static var astroStatusCritical:NativeColor
    { return astroColor("Astro Status Critical")}
    

    //MARK: UIColor - Astro Classification colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro classification colors, from lowest to highest
    //——————————————————————————————————————————————————————————————————————————————
    static var astroClassificationUnclassified:NativeColor
    {  return astroColor("Astro Classification Unclassified")}
    
    static var astroClassificationCUI:NativeColor
    { return astroColor("Astro Classification Cui")}

    static var astroClassificationConfidential:NativeColor
    { return astroColor("Astro Classification Confidential")}
    
    static var astroClassificationSecret:NativeColor
    { return astroColor("Astro Classification Secret")}
    
    static var astroClassificationTopSecret:NativeColor
    { return astroColor("Astro Classification Topsecret")}
    
    static var astroClassificationTopSecretSCI:NativeColor
    { return astroColor("Astro Classification Topsecretsci")}


    //MARK: UIColor - Astro Color Convenience Functions
    //——————————————————————————————————————————————————————————————————————————————
    // Return the Astro status color for the given AstroStatus
    //——————————————————————————————————————————————————————————————————————————————
    static func colorForAstroStatus(_ status:AstroStatus)->NativeColor
    {
        switch status {
        case .off:
            return NativeColor.astroStatusOff
        case .standby:
            return NativeColor.astroStatusStandby
        case .normal:
            return NativeColor.astroStatusNormal
        case .caution:
            return NativeColor.astroStatusCaution
        case .serious:
            return NativeColor.astroStatusSerious
        case .critical:
            return NativeColor.astroStatusCritical
        }
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Return a random Astro status color.
    // Useful for debugging or demo.
    //——————————————————————————————————————————————————————————————————————————————
    static func randomStatusColor()->NativeColor
    {
        return colorForAstroStatus(AstroStatus.randomStatus())
    }
}


