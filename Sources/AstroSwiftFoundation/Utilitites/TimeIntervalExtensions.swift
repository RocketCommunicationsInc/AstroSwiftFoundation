//
//  TimeIntervalExtensions.swift
//  
//
//  Created by Jeff Hokit on 1/9/23.
//

import Foundation


// extend TimeInterval to output units of time as Strings, always with two digits (two or more digits for days)
extension TimeInterval{
    
    func days()->String {
        
        let time = NSInteger(self)
        let days = abs((time / 86400))
        
        return String(format: "%0.2d",days)
    }
    
    func hours()->String {
        
        let time = NSInteger(self)
        let hours = abs((time / 3600) % 24)
        
        return String(format: "%0.2d",hours)
    }
    
    func minutes()->String {
        
        let time = NSInteger(self)
        let minutes = abs((time / 60) % 60)
        
        return String(format: "%0.2d",minutes)
    }
    
    func seconds()->String {
        
        let time = NSInteger(self)
        let seconds = abs(time % 60)
        
        return String(format: "%0.2d",seconds)
    }
}
