//
//  AstroClock.swift
//  
//
//  Created by Jeff Hokit on 1/5/23.
//

import SwiftUI
import Foundation

public struct AstroClock: View {
    
    public init(verbatimFormatter: Date.VerbatimFormatStyle,
                digitFont: Font = .system(.body).weight(.semibold).monospacedDigit()) {
        self.verbatimFormatter = verbatimFormatter
        self.digitFont = digitFont
    }
    
    public init(formatter: Date.FormatStyle,
                digitFont: Font = .system(.body).weight(.semibold).monospacedDigit()) {
        self.formatter = formatter
        self.digitFont = digitFont
    }
    
    
    // Two premade format styles that match Astro clock styling, as typically used in Aerospace
    static public let astroDayTime = Date.VerbatimFormatStyle(format: "\(dayOfYear: .threeDigits) \(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) UTC", locale: .current,timeZone: TimeZone.gmt, calendar: .current)

    static public let astroTime = Date.VerbatimFormatStyle(format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) UTC", locale: .current,timeZone: TimeZone.gmt, calendar: .current)

    @State private var now:Date = Date()
   
    // use one of the two initializers to create a clock with either a Date.VerbatimFormatStyle or a simple Date.FormatStyle
    @State private var verbatimFormatter: Date.VerbatimFormatStyle?
    @State private var formatter: Date.FormatStyle?

    
    // defaults font can be overridden
    var digitFont:Font = .system(.body).weight(.semibold).monospacedDigit()

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
    
    // defaults can be overridden
    @State var verbatimFormatter: Date.VerbatimFormatStyle
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
    
    // defaults can be overridden
    @State var formatter: Date.FormatStyle
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
            AstroClock(verbatimFormatter: AstroClock.astroDayTime)
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
                .week(.defaultDigits), digitFont:Font.system(.title3)).foregroundColor(.blue).monospacedDigit()
        }
    }
}

