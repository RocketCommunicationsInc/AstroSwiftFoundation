//
//  ColorTests.swift
//  
//
//  Created by rocketjeff on 7/13/22.
//

import XCTest
import SwiftUI
import AstroSwiftFoundation

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif

class ColorTests: XCTestCase {

    static var semanticColors = [
        Color.astroUIBackground,
        Color.astroUISecondaryBackground,
        Color.astroUITertiaryBackground,
        Color.astroUIGroupedBackground,
        Color.astroUISecondaryGroupedBackground,
        Color.astroUITertiaryGroupedBackground,
        Color.astroUIAccent]
    
    static var statusColors = [
        Color.astroStatusOff,
        Color.astroStatusStandby,
        Color.astroStatusNormal,
        Color.astroStatusCaution,
        Color.astroStatusSerious,
        Color.astroStatusCritical]
    
    static var classificationColors = [
        Color.astroClassificationUnclassified,
        Color.astroClassificationCUI,
        Color.astroClassificationConfidential,
        Color.astroClassificationSecret,
        Color.astroClassificationTopSecret,
        Color.astroClassificationTopSecretSCI]

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Look for colors with zero RGB components (white). This happens when the Color does not load from resources.
    func testColorsForZeroComponents()
    {
        findColorsWithZeroComponents(ColorTests.semanticColors)  // cannot test semantic colors in light mode because it contains intentional zero (white) colors
        findColorsWithZeroComponents(ColorTests.statusColors)
        findColorsWithZeroComponents(ColorTests.classificationColors)
    }
    
    // Look for colors with zero RGB components (white)
    func findColorsWithZeroComponents(_ colors:[Color])   {
        
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        for color in colors{
            let components = NativeColor(color).cgColor.components! // get color components as an array of floats
            let total = components.reduce(0, +) // sum of the component values
            XCTAssertTrue(total > 0.0, "zero color found named \(color.description)")  // check for all zeroes (white)
        }
    }

    // Look for duplicate colors
    func testColorsForDuplicates()  {
        findDuplicateColors(ColorTests.statusColors)
        findDuplicateColors(ColorTests.classificationColors)
        // cannot test semantic colors because they contain intentional duplicates
    }
    
    // Look for duplicate colors within an array of Colors
    func findDuplicateColors(_ colors:[Color])   {
        var colorDictionary = Set<[CGFloat]>()
        
        #if canImport(UIKit)
        typealias NativeColor = UIColor
        #elseif canImport(AppKit)
        typealias NativeColor = NSColor
        #endif

        for color in colors{
            let components = NativeColor(color).cgColor.components! // get color components as an array of floats
            let result = colorDictionary.insert(components) // insert into a dictionary, hashing the array to a unique value
            XCTAssertTrue(result.inserted, "duplicate color found named \(color.description)") // test that the insertion succeded, that no previous entry had the same hash value
        }
    }


}
