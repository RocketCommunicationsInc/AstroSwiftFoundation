//
//  Clock.swift
//  
//
//  Created by Jeff Hokit on 1/5/23.
//

import SwiftUI
import Foundation

let spaceDayTimeVerbatimFormatStyle = Date.VerbatimFormatStyle(format: "\(dayOfYear: .threeDigits) \(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits)", locale: .current,timeZone: TimeZone.gmt, calendar: .current)

let spaceTimeVerbatimFormatStyle = Date.VerbatimFormatStyle(format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits):\(second: .twoDigits)", locale: .current,timeZone: TimeZone.gmt, calendar: .current)

struct Clock: View {
    
    @State private var now:Date = Date()
    var timeStr = "test"
    
    // defaults can be overridden
    var digitStyle:Font.TextStyle = .body
    @State var verbatimFormatter: Date.VerbatimFormatStyle?
    @State var formatter: Date.FormatStyle?

    
    var body: some View {
                                  
        if let verbatimFormatter
        {
            VerbatimClock(digitStyle:digitStyle, verbatimFormatter: verbatimFormatter)
        }
        else if let formatter
        {
            StyledClock(digitStyle:digitStyle, formatter: formatter)
        }
    }
}

fileprivate struct VerbatimClock: View {
    
    @State private var now:Date = Date()
    
    // defaults can be overridden
    var digitStyle:Font.TextStyle = .body
    @State var verbatimFormatter: Date.VerbatimFormatStyle


    var body: some View {
        
        let digitFont = Font.system(digitStyle)
            .weight(.semibold)
            .monospacedDigit()
                          
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

fileprivate struct StyledClock: View {
    
    @State private var now:Date = Date()
    
    // defaults can be overridden
    var digitStyle:Font.TextStyle = .body
    @State var formatter: Date.FormatStyle

    var body: some View {
        
        let digitFont = Font.system(digitStyle)
            .weight(.semibold)
            .monospacedDigit()
                          
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
            Clock(verbatimFormatter: spaceTimeVerbatimFormatStyle)
            Clock(verbatimFormatter: spaceDayTimeVerbatimFormatStyle)
            Clock(formatter: Date.FormatStyle())
        }
    }
}
