//
//  Counter.swift
//  Astro Launches
//
//  Created by rocketjeff on 1/6/22.
//

import SwiftUI

struct CounterOptions: OptionSet {
    let rawValue: UInt
    
    static let day = CounterOptions(rawValue: 1 << 0)
    static let hour = CounterOptions(rawValue: 1 << 1)
    static let minute = CounterOptions(rawValue: 1 << 2)
    static let second = CounterOptions(rawValue: 1 << 3)
    static let leadingSign = CounterOptions(rawValue: 1 << 4)
    static let labels = CounterOptions(rawValue: 1 << 5)
    
    static let standard: CounterOptions = [.day,.hour,.minute,.second]
    static let all: CounterOptions = [.day,.hour,.minute,.second,.leadingSign]
}

struct Counter: View {
    
    @State public var targetDate:Date
    @State private var timeRemaining: TimeInterval = 0

    // options
    var options:CounterOptions = .standard

    // defaults sizes can be overridden
    var digitStyle:Font.TextStyle = .body
    var labelStyle:Font.TextStyle = .caption2
    
//    /// Create a Tag with default color and the specified text.
//    /// - Parameters:
//    ///     - text: The text displayed in the Tag
//    public init (targetDate: Date)
//    {
//        _targetDate = State(initialValue:targetDate)
//        self.options = .standard
//    }
//
//    /// Create a Tag with an AstroStatus color and the specified text.
//    /// - Parameters:
//    ///     - text: The text displayed in the Tag
//    ///     - status: The AstroStatus color and symbol
//    public init (targetDate: Date, options: CounterOptions)
//    {
//        _targetDate = State(initialValue:targetDate)
//        self.options = options
//    }
    
    var body: some View {
        HStack()
        {
            let digitFont = Font.system(digitStyle)
                .weight(.semibold)
                .monospacedDigit()
            let labelFont = Font.system(labelStyle)
            
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
        
#if os(iOS) || os(tvOS) || os(watchOS)
        .foregroundColor(Color(.label))
#endif
#if os(macOS)
        .foregroundColor(Color(.labelColor))
#endif
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
            Counter(targetDate: Date(timeIntervalSinceNow: 500000), options: .all)
            Counter(targetDate: Date())
                .preferredColorScheme(.dark)
        }
    }
}

