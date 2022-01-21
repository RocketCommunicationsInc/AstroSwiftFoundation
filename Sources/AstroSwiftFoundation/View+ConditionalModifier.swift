//
//  View+ConditionalModifier.swift
//  Astro Launches
//
//  Created by rocketjeff on 8/27/21.
//  Based on the clever advice found at: https://swiftui-lab.com/view-extensions-for-better-code-readability/
//  also seen at: https://stackoverflow.com/questions/57943591/swiftui-how-do-i-check-to-see-if-dark-mode-is-enabled/57944288#57944288
//

import SwiftUI


extension View {
    // If condition is met, apply modifier, otherwise, leave the view untouched
    public func conditionalModifier<T>(_ condition: Bool, _ modifier: T) -> some View where T: ViewModifier {
        Group {
            if condition {
                self.modifier(modifier)
            } else {
                self
            }
        }
    }
}

extension View {
    // Apply trueModifier if condition is met, or falseModifier if not.
    public func conditionalModifier<M1, M2>(_ condition: Bool, _ trueModifier: M1, _ falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
        Group {
            if condition {
                self.modifier(trueModifier)
            } else {
                self.modifier(falseModifier)
            }
        }
    }
}

// An example ViewModifier subclass
struct ForceDarkMode: ViewModifier {
    func body(content: Content) -> some View {
        content.preferredColorScheme(.dark)
    }
}

/* Sample usage
 
 var body: some View{
     NavigationView{
    ....
    }.conditionalModifier(darkMode, ForceDarkMode())
 }
 
*/
