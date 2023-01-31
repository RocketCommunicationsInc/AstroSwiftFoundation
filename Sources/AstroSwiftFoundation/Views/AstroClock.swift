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
    private var suffix:String
    
    public init() {
        self.verbatimFormatter = AstroClock.astroDayTime
        self.digitFont = .system(.body).weight(.semibold).monospacedDigit()
        self.suffix = ""
    }
    
    public init(verbatimFormatter: Date.VerbatimFormatStyle,
                textStyle: Font.TextStyle = .body,
                suffix:String = "") {
        self.verbatimFormatter = verbatimFormatter
        self.digitFont = .system(textStyle).weight(.semibold).monospacedDigit()
        self.suffix = suffix
    }
    
    public init(formatter: Date.FormatStyle,
                textStyle: Font.TextStyle = .body,
                suffix:String = "") {
        self.formatter = formatter
        self.digitFont = .system(textStyle).weight(.semibold).monospacedDigit()
        self.suffix = suffix
    }
    
    // Two premade format styles that match Astro clock styling, as typically used in Aerospace
    static public let astroDayTime = Date.VerbatimFormatStyle(format: "\(dayOfYear: .threeDigits) \(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits)", locale: .current,timeZone: TimeZone.gmt, calendar: .current)
    
    static public let astroTime = Date.VerbatimFormatStyle(format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits)", locale: .current,timeZone: TimeZone.gmt, calendar: .current)
    
    // depending on which initializers was used, get the body from one of our private classes
    public var body: some View {
        if let verbatimFormatter {
            VerbatimClock(verbatimFormatter: verbatimFormatter, digitFont: digitFont, suffix: suffix)
        }
        else if let formatter {
            StyledClock(formatter: formatter, digitFont: digitFont, suffix: suffix)
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
    var suffix:String

    var body: some View {
        let timeStr = now.formatted(verbatimFormatter) + suffix
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
    var suffix:String

    var body: some View {
        let timeStr = now.formatted(formatter) + suffix
        Text(timeStr).font(digitFont)
            .onReceive(centralTimer) { date in
                now = date
            }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            AstroClock(verbatimFormatter: AstroClock.astroTime, suffix: " UTC")
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

