//
//  ClassificationMarker.swift
//  
//  Created by rocketjeff on 6/27/22.
//

import SwiftUI


/// A SwiftUI view that marks a small area of Classified information.
///
/// ClassificationMarker scales in response to accessibility settings.
///
/// Read more about  [Classification requirements.](https://www.astrouxds.com/components/classification-markings/)
public struct ClassificationMarker: View {
    public var classification:Classification

    @ScaledMetric private var cornerRadius: CGFloat = 3
    @ScaledMetric private var verticalPadding: CGFloat = 3
    @ScaledMetric private var horizontalPadding: CGFloat = 5
    @ScaledMetric private var shadowRadius: CGFloat = 1
    @Environment(\.colorScheme) var colorScheme
    
    /// Create a ClassificationMarker with  the specified Classification.
    public init (_ classification: Classification)
    {
        self.classification = classification
    }

    public var body: some View {
        
        Text(classification.abbreviation)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(classification.textColor)
            .padding([.leading, .trailing],horizontalPadding)
            .padding([.top, .bottom],verticalPadding)
            .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous).fill(classification.color))
            .lineLimit(1)
    }
}


struct ClassificationMarker_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ClassificationMarker(.unclassified)
            ClassificationMarker(.cui)
            ClassificationMarker(.confidential)
            ClassificationMarker(.secret)
            ClassificationMarker(.topSecret)
            ClassificationMarker(.topSecretSCI)
        }
    }
}




