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
}


public struct IntervalTimer: View {
    
    public var targetDate:Date = Date()
    @State private var timeRemaining: TimeInterval = 0

    // options
    var options:IntervalTimerOptions = .standard

    // defaults sizes can be overridden
    var digitFont:Font = .system(.body).weight(.semibold).monospacedDigit()
    var labelFont:Font = .system(.caption2)
    
    // use one of the two initializers to create a clock with either an optionset or Date.IntervalFormatStyle
    var formatter: Date.IntervalFormatStyle?

    public init(targetDate: Date,
                options: IntervalTimerOptions = .standard,
                digitFont: Font = .system(.body).weight(.semibold).monospacedDigit(),
                labelFont: Font = .system(.caption2), formatter: Date.IntervalFormatStyle? = nil) {
        self.targetDate = targetDate
        self.options = options
        self.digitFont = digitFont
        self.labelFont = labelFont
        self.formatter = formatter
    }
    
    public var body: some View {
                
        if let formatter {
            StyledTimer(targetDate: targetDate, digitFont: digitFont, formatter: formatter)
        }
        else  {
            OptionTimer(targetDate: targetDate, options: options, digitFont: digitFont)
        }
    }
}


fileprivate struct StyledTimer: View {
    public var targetDate:Date
    @State private var now: Date = Date()

    // defaults sizes can be overridden
    var digitFont:Font = .system(.body).weight(.semibold).monospacedDigit()
    var labelFont:Font = .system(.caption2)

    var formatter: Date.IntervalFormatStyle

    var body: some View {
        HStack()
        {
            let timeStr = (now..<targetDate).formatted(.timeDuration)
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
    

    var body: some View {
        HStack()
        {
            // Leading Sign
            if options.contains(.leadingSign) {
                VStack (alignment: .trailing){
                    Text(timeRemaining <= 0 ? "-" : "+")
                    Text("")
                }
            }
            
            // Day
            if options.contains(.day) {
                VStack (alignment: .trailing){
                    if options.contains(.day){
                        Text(timeRemaining.days())
                                .font(digitFont)
                        Text("DAYS")
                            .font(labelFont)
                    }
                }
            }
            
            // Hour
            if options.contains(.hour) {
                VStack (alignment: .trailing){
                    Text(timeRemaining.hours())
                        .font(digitFont)
                    Text("HRS")
                        .font(labelFont)
                }
            }
            
            // Minute
            if options.contains(.minute) {
                VStack (alignment: .trailing){
                    Text(timeRemaining.minutes())
                        .font(digitFont)
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
            IntervalTimer(targetDate: Date(), options: [.hour,.minute,.second])
            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), formatter:(Date.IntervalFormatStyle()))
        }
    }
}

