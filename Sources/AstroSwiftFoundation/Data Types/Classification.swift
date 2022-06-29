//
//  Classification.swift
//  
//  Created by rocketjeff on 6/27/22.
//

import Foundation
import SwiftUI

//——————————————————————————————————————————————————————————————————————————————
// The six government classification levels.
// Used by the ClassificationBanner and ClassificationMarker Views
//——————————————————————————————————————————————————————————————————————————————
public enum Classification {
    case unclassified
    case cui
    case confidential
    case secret
    case topSecret
    case topSecretSCI

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
    
    
     //——————————————————————————————————————————————————————————————————————————————
     // Return the appropriate color for the given Classification
     //——————————————————————————————————————————————————————————————————————————————
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
    
    //——————————————————————————————————————————————————————————————————————————————
    // Return the appropriate text color to contrast with the given Classification
    //——————————————————————————————————————————————————————————————————————————————
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
