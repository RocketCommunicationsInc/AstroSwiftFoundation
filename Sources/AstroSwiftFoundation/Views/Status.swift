//
//  Status.swift
//
//  Created by rocketjeff on 4/17/19.
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

/// A SwiftUI view representing an AstroStatus.
///
/// The status may be changed by updating the ``Status/status`` property.
public struct Status: View {
    public var status: AstroStatus

    /// Create a Status view with the specified AstroStatus.
    /// - Parameters:
    ///     - status: The AstroStatus to be displayed
    public init(_ status: AstroStatus) {
        self.status = status
    }

    public var body: some View {
        // The Status images are SFSymbols with custom colors, and should automatically draw in color,
        // but due to a bug in the internal SVG code that the SFSymbols app write our the custom color,
        // they render in black. So, as a workaround, reapply the status color through foregroundColor
        status.image.foregroundColor(status.color)
    }
}

#if os(iOS) || os(tvOS)
/// A UIKit view representing an AstroStatus.
///
public class StatusView: UIImageView {
    
    /// Set the AstroStatus to be displayed.
    public func setAstroStatus(_ status:AstroStatus)
    {
        // The Status images are SFSymbols with custom colors, and should automatically draw in color,
        // but due to a bug in the internal SVG code that the SFSymbols app write our the custom color,
        // they render in black. So, as a workaround, reapply the status color through withTintColor
        self.image = UIImage.imageForAstroStatus(status).withTintColor(UIColor(status.color), renderingMode: .alwaysTemplate))
    }
}
#endif



#if os(watchOS)
/// A WatchKit view representing an AstroStatus.
///
public class StatusView: WKInterfaceImage {
    
    /// Set the AstroStatus to be displayed.
    public func setAstroStatus(_ status:AstroStatus)
    {
        // The Status images are SFSymbols with custom colors, and should automatically draw in color,
        // but due to a bug in the internal SVG code that the SFSymbols app write our the custom color,
        // they render in black. So, as a workaround, reapply the status color through withTintColor
        self.setImage(UIImage.imageForAstroStatus(status).withTintColor(UIColor(status.color), renderingMode: .alwaysTemplate))
    }
}
#endif


#if os(macOS)
/// An AppKit view representing an AstroStatus.
///
public class StatusView: NSImageView {
    
    /// Set the AstroStatus to be displayed.
    public func setAstroStatus(_ status:AstroStatus)
    {
        // The Status images are SFSymbols with custom colors, and should automatically draw in color,
        // but due to a bug in the internal SVG code that the SFSymbols app write our the custom color,
        // they render in black. So, as a workaround, reapply the status color through ???
        self.image = NSImage.imageForAstroStatus(status) // how to tint an NSImage
    }
}
#endif

