//
//  Classification.swift
//  
//
//  Created by rocketjeff on 6/27/22.
//

import Foundation



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
}
