//
//  Timer.swift
//  Astro Launches
//
//  Created by rocketjeff on 1/6/22.
//

import SwiftUI

struct IntervalTimerOptions: OptionSet {
    let rawValue: UInt
    
    static let day = IntervalTimerOptions(rawValue: 1 << 0)
    static let hour = IntervalTimerOptions(rawValue: 1 << 1)
    static let minute = IntervalTimerOptions(rawValue: 1 << 2)
    static let second = IntervalTimerOptions(rawValue: 1 << 3)
    static let leadingSign = IntervalTimerOptions(rawValue: 1 << 4)
    static let labels = IntervalTimerOptions(rawValue: 1 << 5)
    
    static let standard: IntervalTimerOptions = [.day,.hour,.minute,.second]
    static let all: IntervalTimerOptions = [.day,.hour,.minute,.second,.leadingSign]
}


struct IntervalTimer: View {
    
    @State public var targetDate:Date
    @State private var timeRemaining: TimeInterval = 0

    // options
    var options:IntervalTimerOptions = .standard

    // defaults sizes can be overridden
    var digitFont:Font = .system(.body).weight(.semibold).monospacedDigit()
    var labelFont:Font = .system(.caption2)
    
    // use one of the two initializers to create a clock with either an optionset or Date.IntervalFormatStyle
    @State var formatter: Date.IntervalFormatStyle?

    var body: some View {
                
        if let formatter {
            StyledTimer(targetDate: targetDate, digitFont: digitFont, formatter: formatter)
        }
        else  {
            OptionTimer(targetDate: targetDate, digitFont: digitFont)
        }
    }
}


fileprivate struct StyledTimer: View {
    @State public var targetDate:Date
    @State private var now: Date = Date()

    // defaults sizes can be overridden
    var digitFont:Font = .system(.body).weight(.semibold).monospacedDigit()
    var labelFont:Font = .system(.caption2)

    @State var formatter: Date.IntervalFormatStyle

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
    
    @State public var targetDate:Date
    @State private var timeRemaining: TimeInterval = 0

    // options
    var options:IntervalTimerOptions = .standard

    // defaults sizes can be overridden
    var digitFont:Font = .system(.body).weight(.semibold).monospacedDigit()
    var labelFont:Font = .system(.caption2)
    

    var body: some View {
        HStack()
        {
            // Day
            if options.contains(.day) {
                VStack (alignment: .trailing){
                    if options.contains(.day){
                        HStack{
                            if options.contains(.leadingSign) {
                                Text(timeRemaining <= 0 ? "-" : "+")
                            }
                            Text(timeRemaining.days())
                                .font(digitFont)
                        }
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


struct LaunchCountdown_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack(alignment: .trailing){
            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), options: .all)
            IntervalTimer(targetDate: Date())
                .preferredColorScheme(.dark)
            IntervalTimer(targetDate: Date(timeIntervalSinceNow: 500000), formatter:(Date.IntervalFormatStyle())).foregroundColor(.red)
        }
    }
}

