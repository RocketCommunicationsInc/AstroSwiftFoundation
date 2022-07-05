//
//  Classification.swift
//  
//  Created by rocketjeff on 6/27/22.
//

import Foundation
import SwiftUI

/// US Government Classification levels
///
/// Classification is displayed with a ``ClassificationBanner``  or ``ClassificationMarker`` View in SwiftUI apps.
///
///  Read more about  [Classification requirements](https://www.astrouxds.com/components/classification-markings/) .
public enum Classification {
    case unclassified
    case cui
    case confidential
    case secret
    case topSecret
    case topSecretSCI

    /**
    An English description of the Classification
     
    The description should not be altered.
    */
    public var description: String {
        switch self {
        case .unclassified:
            return "UNCLASSIFIED"
        case .cui:
            return "CUI"
        case .confidential:
            return "CONFIDENTIAL"
        case .secret:
            return "SECRET"
        case .topSecret:
            return "TOP SECRET"
        case .topSecretSCI:
            return "TOP SECRET//SCI"
        }
    }
    
    
    /**
    An abbreviation representing the Classification
     
    The abbreviation should not be altered.
    */
    public var abbreviation: String {
        switch self {
        case .unclassified:
            return "U"
        case .cui:
            return "CUI"
        case .confidential:
            return "C"
        case .secret:
            return "S"
        case .topSecret:
            return "TS"
        case .topSecretSCI:
            return "TS//SCI"
        }
    }
    
    
    /**
    The color representing the Classification.
     
    The color should not be altered.
    */
    public var color: Color
     {
         switch self {
         case .unclassified:
             return Color.astroClassificationUnclassified
         case .cui:
             return Color.astroClassificationCUI
         case .confidential:
             return Color.astroClassificationConfidential
         case .secret:
             return Color.astroClassificationSecret
         case .topSecret:
             return Color.astroClassificationTopSecret
         case .topSecretSCI:
             return Color.astroClassificationTopSecretSCI
         }
     }
    
    /**
    The text color to be used atop the ``color`` representing the Classification.
     
    The text color should not be altered.
    */
    public var textColor : Color
    {
        switch self {
        case .unclassified, .cui, .confidential, .secret:
            return .white
        case .topSecret,.topSecretSCI:
            return .black
        }
    }
     
}
