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

/// A SwiftUI view representing an AstroStatus .
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
        self.image = UIImage.imageForAstroStatus(status)
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
        self.setImage(UIImage.imageForAstroStatus(status))
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
        self.image = NSImage.imageForAstroStatus(status)
    }
}
#endif

