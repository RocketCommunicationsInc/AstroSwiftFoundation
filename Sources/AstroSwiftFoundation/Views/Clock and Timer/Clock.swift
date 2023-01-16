//
//  Clock.swift
//  
//
//  Created by Jeff Hokit on 1/5/23.
//

import SwiftUI
import Foundation

struct Clock: View {
    
    // Two premade format styles that match Astro clock styling, as typically used in Aerospace
    static public let astroDayTime = Date.VerbatimFormatStyle(format: "\(dayOfYear: .threeDigits) \(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) UTC", locale: .current,timeZone: TimeZone.gmt, calendar: .current)

    static public let astroTime = Date.VerbatimFormatStyle(format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) UTC", locale: .current,timeZone: TimeZone.gmt, calendar: .current)

    @State private var now:Date = Date()
    
    // defaults font can be overridden
    var digitFont:Font = .system(.body).weight(.semibold).monospacedDigit()
    // use one of the two initializers to create a clock with either a Date.VerbatimFormatStyle or a simple Date.FormatStyle
    @State var verbatimFormatter: Date.VerbatimFormatStyle?
    @State var formatter: Date.FormatStyle?
    
    // depending on which initializers was used, get the body from one of our private classes
    var body: some View {
        if let verbatimFormatter {
            VerbatimClock(digitFont: digitFont, verbatimFormatter: verbatimFormatter)
        }
        else if let formatter {
            StyledClock(digitFont: digitFont, formatter: formatter)
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
    var digitFont:Font
    @State var verbatimFormatter: Date.VerbatimFormatStyle

    var body: some View {
        let timeStr = now.formatted(verbatimFormatter)
        Text(timeStr).font(digitFont)
#if os(iOS) || os(tvOS) || os(watchOS)
        .foregroundColor(Color(.label))
#endif
#if os(macOS)
        .foregroundColor(Color(.labelColor))
#endif
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
    var digitFont:Font
    @State var formatter: Date.FormatStyle

    var body: some View {
        let timeStr = now.formatted(formatter)
        Text(timeStr).font(digitFont)
#if os(iOS) || os(tvOS) || os(watchOS)
        .foregroundColor(Color(.label))
#endif
#if os(macOS)
        .foregroundColor(Color(.labelColor))
#endif
        .onReceive(centralTimer) { date in
            now = date
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Clock(verbatimFormatter: Date.VerbatimFormatStyle(format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits) Z", locale: .current,timeZone: TimeZone.gmt, calendar: .current))
            Clock(verbatimFormatter: Clock.astroTime)
            Clock(verbatimFormatter: Clock.astroDayTime)
            Clock(formatter: Date.FormatStyle())
            Clock(formatter: Date.FormatStyle()
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
                .week(.defaultDigits))
        }
    }
}

