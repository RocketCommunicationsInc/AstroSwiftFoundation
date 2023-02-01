//
//  Timer.swift
//  Astro Launches
//
//  Created by rocketjeff on 1/6/22.
//

import SwiftUI

public struct IntervalTimerOptions: OptionSet {
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    public let rawValue: UInt
    
    static public let day = IntervalTimerOptions(rawValue: 1 << 0)
    static public let hour = IntervalTimerOptions(rawValue: 1 << 1)
    static public let minute = IntervalTimerOptions(rawValue: 1 << 2)
    static public let second = IntervalTimerOptions(rawValue: 1 << 3)
    static public let leadingSign = IntervalTimerOptions(rawValue: 1 << 4)
    static public let labels = IntervalTimerOptions(rawValue: 1 << 5)
    
    static public let standard: IntervalTimerOptions = [.day,.hour,.minute,.second]
    static public let all: IntervalTimerOptions = [.day,.hour,.minute,.second,.leadingSign]
    static public let none: IntervalTimerOptions = []
}

/// A SwiftUI view counting up or down to a target date, updated every second.
///
/// IntervalTimer can be configured with a Swift formatter  of type `Date.IntervalFormatStyle` for a simple one line display, or with a set of `IntervalTimerOptions` to configure a labeled two line display.
public struct IntervalTimer: View {
    
    public var targetDate:Date
    private var digitFont:Font
    private var labelFont:Font
    
    // use one of the two initializers to create a clock with either an optionset or Date.IntervalFormatStyle
    var options:IntervalTimerOptions = .standard
    var formatter: Date.IntervalFormatStyle?

    /// Use an options set to initialize a labeled two line display.
    public init(targetDate: Date,
                options: IntervalTimerOptions = .standard,
                digitTextStyle: Font.TextStyle = .body,
                labelFontStyle: Font.TextStyle = .caption2) {
        self.targetDate = targetDate
        self.options = options
        self.digitFont = .system(digitTextStyle).weight(.semibold).monospacedDigit()
        self.labelFont = .system(labelFontStyle)
        self.formatter = nil
    }
    
    /// Use an IntervalFormatStyle to initialize a formatted single line display.
    public init(targetDate: Date,
                digitTextStyle: Font.TextStyle = .body,
                labelFontStyle: Font.TextStyle = .caption2,
                formatter: Date.IntervalFormatStyle) {
        self.targetDate = targetDate
        self.options = .none
        self.digitFont = .system(digitTextStyle).weight(.semibold).monospacedDigit()
        self.labelFont = .system(labelFontStyle)
        self.formatter = formatter
    }

    public var body: some View {
                
        if let formatter {
            StyledTimer(targetDate: targetDate, digitFont: digitFont, formatter: formatter)
        }
        else  {
            OptionTimer(targetDate: targetDate, options: options, digitFont: digitFont,labelFont: labelFont)
        }
    }
}


fileprivate struct StyledTimer: View {
    public var targetDate:Date
    @State private var now: Date = Date()
    
    // defaults sizes can be overridden
    public var digitFont:Font
    public var formatter: Date.IntervalFormatStyle
    var options:IntervalTimerOptions = .leadingSign

    var body: some View {
        HStack()
        {
            let sign = targetDate > now ? "-" : "+"
            let timeStr = (options.contains(.leadingSign) ? (sign + " ") : "") + (now..<targetDate).formatted(.timeDuration)
            Text(timeStr).font(digitFont)
        }
        .onReceive(centralTimer) { now in
            // refresh the time every second
            self.now = now
        }
    }
}


fileprivate struct OptionTimer: View {
    
    public var targetDate:Date
    @State private var timeRemaining: TimeInterval = 0

    // options
    var options:IntervalTimerOptions = .standard

    // defaults sizes can be overridden
    var digitFont:Font = .system(.body).weight(.semibold).monospacedDigit()
    var labelFont:Font = .system(.caption2)
    @ScaledMetric() var leadingSignSpacing = 2
    var body: some View {
        HStack()
        {            
            // Day
            if options.contains(.day) {
                VStack (alignment: .trailing){
                    if options.contains(.day){
                        HStack(spacing:leadingSignSpacing){
                            if options.contains(.leadingSign) {
                                Text(timeRemaining <= 0 ? "-" : "+")
                            }
                            Text(timeRemaining.days())
                        }.font(digitFont)
                        Text("DAYS")
                            .font(labelFont)
                    }
                }
            }
            
            // Hour
            if options.contains(.hour) {
                VStack (alignment: .trailing){
                    HStack(spacing:leadingSignSpacing){
                        if options.contains(.leadingSign) && !options.contains(.day) {
                            Text(timeRemaining <= 0 ? "-" : "+")
                        }
                        Text(timeRemaining.hours())
                    }.font(digitFont)
                    Text("HRS")
                        .font(labelFont)
                }
            }
            
            // Minute
            if options.contains(.minute) {
                VStack (alignment: .trailing){
                    HStack(spacing:leadingSignSpacing){
                        if options.contains(.leadingSign) && !options.contains(.hour) {
                            Text(timeRemaining <= 0 ? "-" : "+")
                        }
                        Text(timeRemaining.minutes())
                    }.font(digitFont)
                    Text("MIN")
                        .font(labelFont)
                }
            }
            
            // Second
            if options.contains(.second){
                VStack (alignment: .trailing){
                    Text(timeRemaining.seconds())
                        .font(digitFont)
                    /*     experimental animation
                     .transition(.opacity.animation(.easeInOut(duration:0.3))).id("Seconds" + timeRemaining.seconds())
                     */
                    Text("SEC")
                        .font(labelFont)
                }
            }
        }
        .onReceive(centralTimer) { now in
            // refresh the time every second
            calcTimeRemaining(now:now)
        }
        .onAppear {
            // refresh the time when first shown
            calcTimeRemaining(now: Date())
        }

    }
    
    func calcTimeRemaining(now:Date)
    {
        timeRemaining = now.timeIntervalSince(targetDate)
    }
}


struct IntervalTimer_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack(alignment: .trailing, spacing:4){
            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), options: .all)
            IntervalTimer(targetDate: Date(), options: [.leadingSign,.hour,.minute,.second], digitTextStyle: .caption, labelFontStyle: .footnote)
            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000),digitTextStyle: .title2, formatter:(Date.IntervalFormatStyle()))
        }
    }
}

