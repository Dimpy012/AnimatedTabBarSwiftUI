//
//  CurvedTabBarShape.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 18/07/25.
//

import Foundation
import SwiftUI

// Custom curved shape for tab bar
struct CurvedTabBarShape: Shape {
    let selectedIndex: Int
    let tabCount: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tabWidth = rect.width / CGFloat(tabCount)
        let curveWidth: CGFloat = 80
        let curveHeight: CGFloat = 20
        
        // Calculate the center of the selected tab
        let selectedTabCenter = CGFloat(selectedIndex) * tabWidth + tabWidth / 2
        
        // Start from the top-left corner
        path.move(to: CGPoint(x: 0, y: 0))
        
        // Draw to the start of the curve
        let curveStart = selectedTabCenter - curveWidth / 2
        
        if curveStart > 0 {
            path.addLine(to: CGPoint(x: curveStart, y: 0))
        }
        
        // Create the curved dip (more subtle semicircle)
        let controlPoint1 = CGPoint(x: selectedTabCenter - curveWidth * 0.25, y: curveHeight)
        let controlPoint2 = CGPoint(x: selectedTabCenter + curveWidth * 0.25, y: curveHeight)
        let curveEnd = CGPoint(x: selectedTabCenter + curveWidth / 2, y: 0)
        
        path.addCurve(to: curveEnd, control1: controlPoint1, control2: controlPoint2)
        
        // Draw to the top-right corner
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        
        // Draw the right edge
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        
        // Draw the bottom edge
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        
        // Draw the left edge
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        path.closeSubpath()
        
        return path
    }
}
