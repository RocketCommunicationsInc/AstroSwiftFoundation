//
//  ClassificationBanner.swift
//
//  Created by rocketjeff on 6/24/22.
//


import SwiftUI


//——————————————————————————————————————————————————————————————————————————————
// A banner using Astro Classification Colors. Uses the .body font.
// Scales in response to accessibility settings.
//——————————————————————————————————————————————————————————————————————————————
public struct ClassificationBanner: View {
    public var classification:Classification
    @ScaledMetric private var verticalPadding: CGFloat = 3
    @ScaledMetric private var horizontalPadding: CGFloat = 5
    
    public init (_ classification: Classification)
    {
        self.classification = classification
    }
    
    public var body: some View {
        
        Text(classification.description)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundColor(Color.textColorForClassification(classification))
            .padding([.leading, .trailing],horizontalPadding)
            .padding([.top, .bottom],verticalPadding)
            .frame(maxWidth:.infinity)
            .background(Rectangle().fill(Color.colorForClassification(classification)))
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


