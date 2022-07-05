//
//  ClassificationBanner.swift
//
//  Created by rocketjeff on 6/24/22.
//


import SwiftUI


/// A control that spans a large area of the display containing Classified information.
///
/// ClassificationBanner spans the width of its parent view, and scales in response to accessibility settings.
///
/// Read more about  [Classification requirements.](https://www.astrouxds.com/components/classification-markings/)
public struct ClassificationBanner: View {
    public var classification:Classification
    @ScaledMetric private var verticalPadding: CGFloat = 3
    @ScaledMetric private var horizontalPadding: CGFloat = 5
    
    /// Create a ClassificationBanner with  the specified Classification.
    public init (_ classification: Classification)
    {
        self.classification = classification
    }
    
    public var body: some View {
        
        Text(classification.description)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundColor(classification.textColor)
            .padding([.leading, .trailing],horizontalPadding)
            .padding([.top, .bottom],verticalPadding)
            .frame(maxWidth:.infinity)
            .background(Rectangle().fill(classification.color))
            .lineLimit(1)
    }
}

struct ClassificationBanner_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ClassificationBanner(.unclassified)
            ClassificationBanner(.cui)
            ClassificationBanner(.confidential)
            ClassificationBanner(.secret)
            ClassificationBanner(.topSecret)
            ClassificationBanner(.topSecretSCI)
        }
    }
}


