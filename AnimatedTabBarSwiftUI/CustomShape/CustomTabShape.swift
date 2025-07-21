//
//  CustomTabShape.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 18/07/25.
//

import Foundation
import SwiftUI

struct CustomTabShape: Shape {
    var centerX: CGFloat
    
    var animatableData: CGFloat {
        get { centerX }
        set { centerX = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let curveWidth: CGFloat = 120
        let curveDepth: CGFloat = 35
        
        // Start from top-left
        path.move(to: CGPoint(x: 0, y: 0))
        
        // Left edge
        path.addLine(to: CGPoint(x: centerX - curveWidth / 2 - 20, y: 0))
        
        // Curve down then back up
        path.addCurve(
            to: CGPoint(x: centerX, y: curveDepth),
            control1: CGPoint(x: centerX - 35, y: 0),
            control2: CGPoint(x: centerX - 35, y: curveDepth)
        )
        
        path.addCurve(
            to: CGPoint(x: centerX + curveWidth / 2 + 20, y: 0),
            control1: CGPoint(x: centerX + 35, y: curveDepth),
            control2: CGPoint(x: centerX + 35, y: 0)
        )
        
        // Right edge
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

struct TabAnimatable: VectorArithmetic {
    var value: CGFloat = 0
    
    static var zero: TabAnimatable {
        TabAnimatable(value: 0)
    }
    
    static func + (lhs: TabAnimatable, rhs: TabAnimatable) -> TabAnimatable {
        TabAnimatable(value: lhs.value + rhs.value)
    }
    
    static func - (lhs: TabAnimatable, rhs: TabAnimatable) -> TabAnimatable {
        TabAnimatable(value: lhs.value - rhs.value)
    }
    
    static func += (lhs: inout TabAnimatable, rhs: TabAnimatable) {
        lhs.value += rhs.value
    }
    
    static func -= (lhs: inout TabAnimatable, rhs: TabAnimatable) {
        lhs.value -= rhs.value
    }
    
    mutating func scale(by rhs: Double) {
        value *= rhs
    }
    
    var magnitudeSquared: Double {
        Double(value * value)
    }
    
    static func == (lhs: TabAnimatable, rhs: TabAnimatable) -> Bool {
        lhs.value == rhs.value
    }
}
