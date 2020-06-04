//
//  AstroColors.swift 
//
//  Created by rocketjeff.
//  Copyright © 2019 Rocket Communications, Inc. All rights reserved.
//

#if os(iOS)
import UIKit
#endif

// Extend UIColor to include many conveniece methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
extension UIColor
{
    //MARK: colorDebugging
    // If an Astro color fails to load from resources, show this noticeable brown debug color instead
    static var astroDebugColor = UIColor.brown
    
    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the UIColor constructor to return a debug color instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroColor(named:String)->UIColor
    {
        return UIColor(named:named) ?? astroDebugColor
    }
    
    
    //MARK: Astro Semantic UI colors
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
    {return astroColor(named:"Astro UI Table Selected Cell Color")} // astroUIPrimary, astroUITertiary

    static var astroUITableSeparator:UIColor
    {return astroColor(named:"Astro UI Table Separator Color")} // astroUIQuaternary, astroUITertiaryDarken2

    static var astroUIBackground:UIColor
    {return astroColor(named:"Astro UI Background Color")} //astroUIQuaternaryLighten3, astroUITertiaryDarken1


    //——————————————————————————————————————————————————————————————————————————————
    // Astro Core UI colors
    //——————————————————————————————————————————————————————————————————————————————

    //MARK: astroUIPrimary
    static var astroUIPrimary:UIColor
    {return astroColor(named:"astroUIPrimaryColor")}
    
    static var astroUIPrimaryDarken1:UIColor
    {return astroColor(named:"astroUIPrimaryDarken1Color")}

    static var astroUIPrimaryDarken2:UIColor
    {return astroColor(named:"astroUIPrimaryDarken2Color")}

    static var astroUIPrimaryDarken3:UIColor
    {return astroColor(named:"astroUIPrimaryDarken3Color")}

    static var astroUIPrimaryDarken4:UIColor
    {return astroColor(named:"astroUIPrimaryDarken4Color")}
    
    static var astroUIPrimaryLighten1:UIColor
    {return astroColor(named:"astroUIPrimaryLighten1Color")}

    static var astroUIPrimaryLighten2:UIColor
    {return astroColor(named:"astroUIPrimaryLighten2Color")}

    static var astroUIPrimaryLighten3:UIColor
    {return astroColor(named:"astroUIPrimaryLighten3Color")}

    static var astroUIPrimaryLighten4:UIColor
    {return astroColor(named:"astroUIPrimaryLighten4Color")}

    //MARK: astroUISecondary
    static var astroUISecondary:UIColor
    {return astroColor(named:"astroUISecondaryColor")}

    static var astroUISecondaryDarken1:UIColor
    {return astroColor(named:"astroUISecondaryDarken1Color")}

    static var astroUISecondaryDarken2:UIColor
    {return astroColor(named:"astroUISecondaryDarken2Color")}

    static var astroUISecondaryDarken3:UIColor
    {return astroColor(named:"astroUISecondaryDarken3Color")}

    static var astroUISecondaryDarken4:UIColor
    {return astroColor(named:"astroUISecondaryDarken4Color")}
    
    static var astroUISecondaryLighten1:UIColor
    {return astroColor(named:"astroUISecondaryLighten1Color")}

    static var astroUISecondaryLighten2:UIColor
    {return astroColor(named:"astroUISecondaryLighten2Color")}

    static var astroUISecondaryLighten3:UIColor
    {return astroColor(named:"astroUISecondaryLighten3Color")}

    static var astroUISecondaryLighten4:UIColor
    {return astroColor(named:"astroUIPrimaryLighten4Color")}

    //MARK: astroUITertiary
    static var astroUITertiary:UIColor
    {return astroColor(named:"astroUITertiaryColor")}

    static var astroUITertiaryDarken1:UIColor
    {return astroColor(named:"astroUITertiaryDarken1Color")}

    static var astroUITertiaryDarken2:UIColor
    {return astroColor(named:"astroUITertiaryDarken2Color")}

    static var astroUITertiaryDarken3:UIColor
    {return astroColor(named:"astroUITertiaryDarken3Color")}

    static var astroUITertiaryDarken4:UIColor
    {return astroColor(named:"astroUITertiaryDarken4Color")}
    
    static var astroUITertiaryLighten1:UIColor
    {return astroColor(named:"astroUITertiaryLighten1Color")}

    static var astroUITertiaryLighten2:UIColor
    {return astroColor(named:"astroUITertiaryLighten2Color")}

    static var astroUITertiaryLighten3:UIColor
    {return astroColor(named:"astroUITertiaryLighten3Color")}

    static var astroUITertiaryLighten4:UIColor
    {return astroColor(named:"astroUIPrimaryLighten4Color")}

    //MARK: astroUIQuaternary
    static var astroUIQuaternary:UIColor
    {return astroColor(named:"astroUIQuaternaryColor")}
    
    static var astroUIQuaternaryDarken1:UIColor
    {return astroColor(named:"astroUIQuaternaryDarken1Color")}

    static var astroUIQuaternaryDarken2:UIColor
    {return astroColor(named:"astroUIQuaternaryDarken2Color")}

    static var astroUIQuaternaryDarken3:UIColor
    {return astroColor(named:"astroUIQuaternaryDarken3Color")}

    static var astroUIQuaternaryDarken4:UIColor
    {return astroColor(named:"astroUIQuaternaryDarken4Color")}
    
    static var astroUIQuaternaryLighten1:UIColor
    {return astroColor(named:"astroUIQuaternaryLighten1Color")}

    static var astroUIQuaternaryLighten2:UIColor
    {return astroColor(named:"astroUIQuaternaryLighten2Color")}

    static var astroUIQuaternaryLighten3:UIColor
    {return astroColor(named:"astroUIQuaternaryLighten3Color")}

    static var astroUIQuaternaryLighten4:UIColor
    {return astroColor(named:"astroUIPrimaryLighten4Color")}

    
    //MARK: Astro Status colors
    //——————————————————————————————————————————————————————————————————————————————
    // Astro status colors
    //——————————————————————————————————————————————————————————————————————————————
    static var astroStatusOff:UIColor
    {  return astroColor(named:"astroStatusOffColor")}
    
    static var astroStatusStandby:UIColor
    { return astroColor(named:"astroStatusStandbyColor")}

    static var astroStatusNormal:UIColor
    { return astroColor(named:"astroStatusNormalColor")}
    
    static var astroStatusCaution:UIColor
    { return astroColor(named:"astroStatusCautionColor")}
    
    static var astroStatusSerious:UIColor
    { return astroColor(named:"astroStatusSeriousColor")}
    
    static var astroStatusCritical:UIColor
    { return astroColor(named:"astroStatusCriticalColor")}
    

    //MARK: Astro Color Convenience Functions
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
