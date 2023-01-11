//
//  Clock.swift
//  
//
//  Created by Jeff Hokit on 1/5/23.
//

import SwiftUI
import Foundation

// create a central timer shared by onscreen clocks and countdown timers so their ticks are synchronized
var centralTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


struct ClockOptions: OptionSet {
    let rawValue: UInt
    
    static let day = ClockOptions(rawValue: 1 << 0)
    static let hour = ClockOptions(rawValue: 1 << 1)
    static let minute = ClockOptions(rawValue: 1 << 2)
    static let second = ClockOptions(rawValue: 1 << 3)
    
    static let standard: CounterOptions = [.day,.hour,.minute,.second]
    static let all: CounterOptions = [.day,.hour,.minute,.second]
}

struct Clock: View {
    
    @State var now:Date = Date()
    
    // defaults sizes can be overridden
    var digitStyle:Font.TextStyle = .body
   // var labelStyle:Font.TextStyle = .caption2
    
    var options:CounterOptions = [.day,.hour,.minute,.second]
    
    var body: some View {
        
        let digitFont = Font.system(digitStyle)
            .weight(.semibold)
            .monospacedDigit()
        

       // let formatted = now.formatted(date: .omitted, time: .complete)
        //let formatted = now.formatted(.dateTime.dayOfYear(.threeDigits).hour().minute().second())
        let formatted = now.formatted(.verbatim("\(dayOfYear: .threeDigits) \(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits)", locale: .current,timeZone: TimeZone.gmt, calendar: .current))
                                      
        Text(formatted).font(digitFont)
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
            Clock()
        }
    }
}
