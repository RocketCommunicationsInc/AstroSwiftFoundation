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

   // static let standard: CounterOptions = [.day,.hour,.minute,.second]
    static let all: CounterOptions = [.day,.hour,.minute,.second]
}

struct Counter: View {
    
    @State var targetDate:Date
    @State var timeRemaining: TimeInterval = 0

    // defaults sizes can be overridden
    var digitStyle:Font.TextStyle = .body
    var labelStyle:Font.TextStyle = .caption2
    
    var options:CounterOptions = .all
    
    var body: some View {
        HStack {
            HStack()
            {
                let digitFont = Font.system(digitStyle).weight(.semibold).monospacedDigit()
                let labelFont = Font.system(labelStyle)
                
                VStack (alignment: .trailing){
                    if options.contains(.day){
                        HStack{
                            Text(timeRemaining <= 0 ? "-" : "+")
                            Text(timeRemaining.days())
                                .font(digitFont)
                        }
                        Text("DAYS")
                            .font(labelFont)
                    }
                }
                
                VStack (alignment: .trailing){
                    Text(timeRemaining.hours())
                        .font(digitFont)
                    Text("HRS")
                        .font(labelFont)
                }
                
                VStack (alignment: .trailing){
                    Text(timeRemaining.minutes())
                        .font(digitFont)
//                        .transition(.opacity.animation(.easeInOut(duration:0.3)))
//                        .id("Minutes" + timeRemaining.minutes())
                    Text("MIN")
                        .font(labelFont)
                }
                
                VStack (alignment: .trailing){
                    Text(timeRemaining.seconds())
                        .font(digitFont)
//                        .transition(.scale.animation(.easeInOut(duration:0.3)))
//                        .id("Seconds" + timeRemaining.seconds())

                    Text("SEC")
                        .font(labelFont)
                }
                
            }
            
#if os(iOS)
    .foregroundColor(Color(.label))
#endif
#if os(macOS)
    .foregroundColor(Color(.labelColor))
#endif

            
            .onReceive(centralTimer) { _ in
                    // refresh the time every second
                    calcTimeRemaining()
                }
            .onAppear {
                    // refresh the time when first shown
                    calcTimeRemaining()
                }
        }
    }
    

    func calcTimeRemaining()
    {
        timeRemaining = Date().timeIntervalSince(targetDate)
    }
}

// extend TimeInterval to output units of time as Strings, always with two digits
extension TimeInterval{
    
    func days()->String {
        
        let time = NSInteger(self)
        let days = abs((time / 86400))
        
        return String(format: "%0.2d",days)
    }
    
    func hours()->String {
        
        let time = NSInteger(self)
        let hours = abs((time / 3600) % 24)

        return String(format: "%0.2d",hours)
    }
    
    func minutes()->String {
        
        let time = NSInteger(self)
        let minutes = abs((time / 60) % 60)

        return String(format: "%0.2d",minutes)
    }
    
    func seconds()->String {
        
        let time = NSInteger(self)
        let seconds = abs(time % 60)

        return String(format: "%0.2d",seconds)
    }
}


struct LaunchCountdown_Previews: PreviewProvider {
    static var previews: some View {
        
        Counter(targetDate: Date(timeIntervalSinceNow: 500000))
            .previewLayout(.sizeThatFits)
        Counter(targetDate: Date())
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}

