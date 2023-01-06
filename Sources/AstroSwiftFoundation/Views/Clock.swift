//
//  Clock.swift
//  
//
//  Created by Jeff Hokit on 1/5/23.
//

import SwiftUI

// create a central timer shared by onscreen clocks and countdown timers so their ticks are synchronized
var centralTimer =  Timer.publish(every: 1, on: .main, in: .common).autoconnect()


struct Clock: View {
    
    init(){
        _ = centralTimer
    }
    
    @State var count:Int = 0
    @State var targetDate = Date()
    @State var timeRemaining: TimeInterval = 0

    var body: some View {
        Text("Hello, World!\(count)")
            .onReceive(centralTimer) { _ in
                    // refresh the time every second
                    count += 1
                }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Clock()
    }
}
