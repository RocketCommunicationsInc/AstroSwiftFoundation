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

#if os(watchOS)
import WatchKit
#endif

import SwiftUI

public struct Status: View {
    @Binding var status: AstroStatus

    public init(instatus: Binding<AstroStatus>) {
        self._status = instatus
    }

    public var body: some View {
        Image.imageForAstroStatus(status).foregroundColor(Color.colorForAstroStatus(status))
    }
}

#if os(iOS) || os(tvOS)
public class StatusView: UIImageView {
    
    public func setAstroStatus(_ status:AstroStatus)
    {
        self.image = UIImage.imageForAstroStatus(status)
    }
}
#endif



#if os(watchOS)
public class StatusView: WKInterfaceImage {
    
    public func setAstroStatus(_ status:AstroStatus)
    {
        self.setImage(UIImage.imageForAstroStatus(status))
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

