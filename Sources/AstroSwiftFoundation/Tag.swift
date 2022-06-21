//
//  SwiftUIView.swift
//  
//
//  Created by rocketjeff on 6/3/22.
//

import SwiftUI


// A tag using Astro Status Colors and Status Symbols. Uses the .caption font.
// Scales in response to accessibility settings.
public struct Tag: View {
    public var text:String
    public var status:AstroStatus?
    private let font:Font = .caption
    @ScaledMetric private var cornerRadius: CGFloat = 3
    @ScaledMetric private var verticalPadding: CGFloat = 3
    @ScaledMetric private var horizontalPadding: CGFloat = 5
    @ScaledMetric private var spacing: CGFloat = 1.5
    @ScaledMetric private var shadowRadius: CGFloat = 1
    @Environment(\.colorScheme) var colorScheme
    
    public init (text: String)
    {
        self.text = text
    }
    
    public init (text: String, status: AstroStatus?)
    {
        self.text = text
        self.status = status
    }
    
    public var body: some View {
        
        // set the stroke color, Astro blue if no status, status color otherwise
        var strokeColor:Color = Color.astroUIAccent
        if let status = status {
            strokeColor = Color.colorForAstroStatus(status)
        }

        // A symbol and text if status, just text otherwise
        return HStack(spacing:spacing){
            if let status = status {
                 Text(Image.imageForAstroStatus(status))
                    .font(font).foregroundColor(Color.colorForAstroStatus(status))
            }
            Text(text)
             .font(font)//.foregroundColor(Color(.label))
             .lineLimit(1)
        }
        .padding([.leading, .trailing],horizontalPadding).padding([.top, .bottom],verticalPadding)
        .background(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        .stroke(strokeColor, style: StrokeStyle(lineWidth: 1))
                        .background(colorScheme == .light ? strokeColor.opacity(0.1) : strokeColor.opacity(0.1) )
                        .shadow(color:strokeColor, radius: shadowRadius, x:0, y: 0))
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Tag(text: "Astro")
            Tag(text: "Astro").environment(\.sizeCategory, .extraLarge)
            Tag(text: "extraSmall", status:.off).environment(\.sizeCategory, .extraSmall)
            Tag(text: "small", status:.standby).environment(\.sizeCategory, .small)
            Tag(text: "medium", status:.normal).environment(\.sizeCategory, .medium)
            Tag(text: "large (standard)", status:.caution).environment(\.sizeCategory, .large)
            Tag(text: "extraLarge", status:.serious).environment(\.sizeCategory, .extraLarge)
            Tag(text: "extraExtraExtraLarge", status:.critical).environment(\.sizeCategory, .extraExtraExtraLarge)
            Tag(text: "accessibilityExtraLarge", status:.critical).environment(\.sizeCategory, .accessibilityExtraLarge)
        }.preferredColorScheme(.light).previewInterfaceOrientation(.landscapeLeft)
    
        VStack {
            Tag(text: "Astro")
            Tag(text: "Astro").environment(\.sizeCategory, .extraLarge)
            Tag(text: "extraSmall", status:.off).environment(\.sizeCategory, .extraSmall)
            Tag(text: "small", status:.standby).environment(\.sizeCategory, .small)
            Tag(text: "medium", status:.normal).environment(\.sizeCategory, .medium)
            Tag(text: "large (standard)", status:.caution).environment(\.sizeCategory, .large)
            Tag(text: "extraLarge", status:.serious).environment(\.sizeCategory, .extraLarge)
            Tag(text: "extraExtraExtraLarge", status:.critical).environment(\.sizeCategory, .extraExtraExtraLarge)
            Tag(text: "accessibilityExtraLarge", status:.critical).environment(\.sizeCategory, .accessibilityExtraLarge)
        }.preferredColorScheme(.dark).previewInterfaceOrientation(.landscapeLeft)

    }
}
