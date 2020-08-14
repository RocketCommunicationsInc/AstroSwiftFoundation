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

class StatusView: UIImageView {
    
    func setAstroStatus(_ status:AstroStatus)
    {
        self.image = UIImage.imageForAstroStatus(status)
    }
    
}
