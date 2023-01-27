//
//  AstroClock.swift
//  
//
//  Created by Jeff Hokit on 1/5/23.
//

import SwiftUI
import Foundation

public struct AstroClock: View {
    
     private var verbatimFormatter: Date.VerbatimFormatStyle?
     private var formatter: Date.FormatStyle?
     private var digitFont:Font

    public init() {
        self.verbatimFormatter = AstroClock.astroDayTime
        self.digitFont = .system(.body).weight(.semibold).monospacedDigit()
    }

    
    public init(verbatimFormatter: Date.VerbatimFormatStyle,
                textStyle: Font.TextStyle = .body) {
        self.verbatimFormatter = verbatimFormatter
        self.digitFont = .system(textStyle).weight(.semibold).monospacedDigit()
    }

    public init(formatter: Date.FormatStyle,
                textStyle: Font.TextStyle = .body) {
        self.formatter = formatter
        self.digitFont = .system(textStyle).weight(.semibold).monospacedDigit()
    }

    // Two premade format styles that match Astro clock styling, as typically used in Aerospace
    static public let astroDayTime = Date.VerbatimFormatStyle(format: "\(dayOfYear: .threeDigits) \(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) UTC", locale: .current,timeZone: TimeZone.gmt, calendar: .current)

    static public let astroTime = Date.VerbatimFormatStyle(format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) UTC", locale: .current,timeZone: TimeZone.gmt, calendar: .current)

    // depending on which initializers was used, get the body from one of our private classes
    public var body: some View {
        if let verbatimFormatter {
            VerbatimClock(verbatimFormatter: verbatimFormatter, digitFont: digitFont)
        }
        else if let formatter {
            StyledClock(formatter: formatter, digitFont: digitFont)
        }
        else {
            Text("formatter not set")
        }
    }
    
}


// One of two internal Clock variations encapulated by the Clock class.
// This on expects a formatter of type Date.VerbatimFormatStyle
fileprivate struct VerbatimClock: View {
    
    @State private var now:Date = Date()
    var verbatimFormatter: Date.VerbatimFormatStyle
    var digitFont:Font

    var body: some View {
        let timeStr = now.formatted(verbatimFormatter)
        Text(timeStr).font(digitFont)
        .onReceive(centralTimer) { date in
            now = date
        }
    }
}


// One of two internal Clock variations encapulated by the Clock class.
// This on expects a formatter of type Date.FormatStyle
fileprivate struct StyledClock: View {
    
    @State private var now:Date = Date()
    var formatter: Date.FormatStyle
    var digitFont:Font

    var body: some View {
        let timeStr = now.formatted(formatter)
        Text(timeStr).font(digitFont)
        .onReceive(centralTimer) { date in
            now = date
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            AstroClock(verbatimFormatter: Date.VerbatimFormatStyle(format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) Z", locale: .current,timeZone: TimeZone.gmt, calendar: .current))
            AstroClock(verbatimFormatter: AstroClock.astroTime)
            AstroClock(verbatimFormatter: AstroClock.astroDayTime,textStyle: .body)
            AstroClock(formatter: Date.FormatStyle())
            AstroClock(formatter: Date.FormatStyle()
                .year(.defaultDigits)
                .month(.abbreviated)
                .day(.twoDigits)
                .hour(.defaultDigits(amPM: .abbreviated))
                .minute(.twoDigits)
                .second(.twoDigits)
                .timeZone(.exemplarLocation)
                .era(.abbreviated)
                .dayOfYear(.defaultDigits)
                .weekday(.wide)
                .week(.defaultDigits), textStyle:.caption2).foregroundColor(.blue).monospacedDigit()
        }
    }
}

