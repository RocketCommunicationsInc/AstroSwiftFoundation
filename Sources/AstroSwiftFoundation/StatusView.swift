//
//  StatusView.swift
//  Astro iOS Demo
//
//  Created by rocketjeff on 4/17/19.
//  Copyright © 2019 Rocket Communications, Inc. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
public class StatusView: UIImageView {
    
    public func setAstroStatus(_ status:AstroStatus)
    {
        self.image = UIImage.imageForAstroStatus(status)
    }
}
#endif


#if os(macOS)
public class StatusView: NSImageView {
    
    public func setAstroStatus(_ status:AstroStatus)
    {
        self.image = NSImage.imageForAstroStatus(status)
    }
}
#endif

