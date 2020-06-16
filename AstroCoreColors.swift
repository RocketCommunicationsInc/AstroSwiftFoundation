//
//  AstroCoreColors.swift
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

// Extend UIColor to include many conveniece methods to access the Astro UI and Status colors
// Astro color gudelines - https://www.astrouxds.com/design-guidelines/color
//
extension UIColor
{
    //MARK: colorDebugging
    // If an Astro color fails to load from resources, show this noticeable yellow debug color instead
    private static var astroCoreDebugColor = UIColor.yellow

    //——————————————————————————————————————————————————————————————————————————————
    // Wrap the the UIColor constructor to return a debug color instead of nil on failure
    //——————————————————————————————————————————————————————————————————————————————
    private static func astroCoreColor(named:String)->UIColor
    {
        return UIColor(named:named) ?? astroCoreDebugColor
    }
    
    //——————————————————————————————————————————————————————————————————————————————
    // Astro Core UI colors
    //——————————————————————————————————————————————————————————————————————————————

    //MARK: astroUIPrimary
    static var astroUIPrimary:UIColor
    {return astroCoreColor(named:"astroUIPrimaryColor")}
    
    static var astroUIPrimaryDarken1:UIColor
    {return astroCoreColor(named:"astroUIPrimaryDarken1Color")}

    static var astroUIPrimaryDarken2:UIColor
    {return astroCoreColor(named:"astroUIPrimaryDarken2Color")}

    static var astroUIPrimaryDarken3:UIColor
    {return astroCoreColor(named:"astroUIPrimaryDarken3Color")}

    static var astroUIPrimaryDarken4:UIColor
    {return astroCoreColor(named:"astroUIPrimaryDarken4Color")}
    
    static var astroUIPrimaryLighten1:UIColor
    {return astroCoreColor(named:"astroUIPrimaryLighten1Color")}

    static var astroUIPrimaryLighten2:UIColor
    {return astroCoreColor(named:"astroUIPrimaryLighten2Color")}

    static var astroUIPrimaryLighten3:UIColor
    {return astroCoreColor(named:"astroUIPrimaryLighten3Color")}

    static var astroUIPrimaryLighten4:UIColor
    {return astroCoreColor(named:"astroUIPrimaryLighten4Color")}

    //MARK: astroUISecondary
    static var astroUISecondary:UIColor
    {return astroCoreColor(named:"astroUISecondaryColor")}

    static var astroUISecondaryDarken1:UIColor
    {return astroCoreColor(named:"astroUISecondaryDarken1Color")}

    static var astroUISecondaryDarken2:UIColor
    {return astroCoreColor(named:"astroUISecondaryDarken2Color")}

    static var astroUISecondaryDarken3:UIColor
    {return astroCoreColor(named:"astroUISecondaryDarken3Color")}

    static var astroUISecondaryDarken4:UIColor
    {return astroCoreColor(named:"astroUISecondaryDarken4Color")}
    
    static var astroUISecondaryLighten1:UIColor
    {return astroCoreColor(named:"astroUISecondaryLighten1Color")}

    static var astroUISecondaryLighten2:UIColor
    {return astroCoreColor(named:"astroUISecondaryLighten2Color")}

    static var astroUISecondaryLighten3:UIColor
    {return astroCoreColor(named:"astroUISecondaryLighten3Color")}

    static var astroUISecondaryLighten4:UIColor
    {return astroCoreColor(named:"astroUIPrimaryLighten4Color")}

    //MARK: astroUITertiary
    static var astroUITertiary:UIColor
    {return astroCoreColor(named:"astroUITertiaryColor")}

    static var astroUITertiaryDarken1:UIColor
    {return astroCoreColor(named:"astroUITertiaryDarken1Color")}

    static var astroUITertiaryDarken2:UIColor
    {return astroCoreColor(named:"astroUITertiaryDarken2Color")}

    static var astroUITertiaryDarken3:UIColor
    {return astroCoreColor(named:"astroUITertiaryDarken3Color")}

    static var astroUITertiaryDarken4:UIColor
    {return astroCoreColor(named:"astroUITertiaryDarken4Color")}
    
    static var astroUITertiaryLighten1:UIColor
    {return astroCoreColor(named:"astroUITertiaryLighten1Color")}

    static var astroUITertiaryLighten2:UIColor
    {return astroCoreColor(named:"astroUITertiaryLighten2Color")}

    static var astroUITertiaryLighten3:UIColor
    {return astroCoreColor(named:"astroUITertiaryLighten3Color")}

    static var astroUITertiaryLighten4:UIColor
    {return astroCoreColor(named:"astroUIPrimaryLighten4Color")}

    //MARK: astroUIQuaternary
    static var astroUIQuaternary:UIColor
    {return astroCoreColor(named:"astroUIQuaternaryColor")}
    
    static var astroUIQuaternaryDarken1:UIColor
    {return astroCoreColor(named:"astroUIQuaternaryDarken1Color")}

    static var astroUIQuaternaryDarken2:UIColor
    {return astroCoreColor(named:"astroUIQuaternaryDarken2Color")}

    static var astroUIQuaternaryDarken3:UIColor
    {return astroCoreColor(named:"astroUIQuaternaryDarken3Color")}

    static var astroUIQuaternaryDarken4:UIColor
    {return astroCoreColor(named:"astroUIQuaternaryDarken4Color")}
    
    static var astroUIQuaternaryLighten1:UIColor
    {return astroCoreColor(named:"astroUIQuaternaryLighten1Color")}

    static var astroUIQuaternaryLighten2:UIColor
    {return astroCoreColor(named:"astroUIQuaternaryLighten2Color")}

    static var astroUIQuaternaryLighten3:UIColor
    {return astroCoreColor(named:"astroUIQuaternaryLighten3Color")}

    static var astroUIQuaternaryLighten4:UIColor
    {return astroCoreColor(named:"astroUIPrimaryLighten4Color")}

    
    
}
