//
//  ChartStyles.swift
//
//  Created by Jeff Hokit on 12/2/22.
//

import SwiftUI
import Charts


///  Applies Astro styling to an AxisGridLine
///    - sets the color
///
///   This is automatically applied by Chart.astroStyle
extension AxisGridLine {
    public func astroStyle() -> some AxisMark {
        return self
            .foregroundStyle(Color.astroDataVisGridline)
    }
}

///  Applies Astro styling to a RuleMark
///    - sets the color
///    - sets the line style
extension RuleMark {
    public func astroStyle() -> some ChartContent {
        return self
            .lineStyle(StrokeStyle(lineWidth: 2, dash: [8]))
            .foregroundStyle(Color.astroDataVisThreshold)
    }
}


///  Applies Astro styling to a BarMark
///    - adds a .5 px black border
extension BarMark {
    public func astroStyle() -> some ChartContent {
        return self
        // add a .25 px black frame around each bar
        .annotation(position: .overlay, alignment: .center, spacing: 0) { context in // starting an one pixel below the bar
            if context.targetSize.height > 1 // if the bar tall enought to contain the frame
            {
                Rectangle() // A one pt black line
                    .fill(Color.clear)
                    .frame(width: context.targetSize.width, height: context.targetSize.height)
                    .border(Color.black, width: 0.25)
            }
        }
    }
}

///  Applies Astro styling to a Chart
///    - sets the color on AxisMarks
///    - move the Y axis to the left
///    - provides a default set of data colors (via chartForegroundStyleScale)
extension Chart {
    public func astroStyle() -> some View {
        modifier(AstroChartStyle())
    }
}

private struct AstroChartStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .chartYAxis {
                AxisMarks(position: .leading) // move the axis to the left
                AxisMarks(values: .automatic) { _ in
                    AxisGridLine()
                        .astroStyle()
                }
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { _ in
                    AxisGridLine(stroke: StrokeStyle())
                        .astroStyle()
                    AxisValueLabel()
                }
            }
            .chartForegroundStyleScale(
                range: [Color.astroDataVis1,
                        Color.astroDataVis4,
                        Color.astroDataVis8,
                        Color.astroDataVis2,
                        Color.astroDataVis5,
                        Color.astroDataVis7,
                        Color.astroDataVis3,
                        Color.astroDataVis6]
            )
    }
}
