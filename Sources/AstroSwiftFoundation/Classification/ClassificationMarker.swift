//
//  ClassificationMarker.swift
//  
//
//  Created by rocketjeff on 6/27/22.
//

import SwiftUI


//——————————————————————————————————————————————————————————————————————————————
// A tag using Astro Classification Colors and abbreviated names.
// Uses the .caption font.
// Scales in response to accessibility settings.
//——————————————————————————————————————————————————————————————————————————————
public struct ClassificationMarker: View {
    public var classification:Classification

    @ScaledMetric private var cornerRadius: CGFloat = 3
    @ScaledMetric private var verticalPadding: CGFloat = 3
    @ScaledMetric private var horizontalPadding: CGFloat = 5
    @ScaledMetric private var shadowRadius: CGFloat = 1
    @Environment(\.colorScheme) var colorScheme
    
    public init (_ classification: Classification)
    {
        self.classification = classification
    }

    public var body: some View {
        
        Text(classification.abbreviation)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(Color.textColorForClassification(classification))
            .padding([.leading, .trailing],horizontalPadding)
            .padding([.top, .bottom],verticalPadding)
            .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous).fill(Color.colorForClassification(classification)))
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




