//
//  CurvedTabBarItem.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 18/07/25.
//

import SwiftUI

// Custom tab bar item for curved design
struct CurvedTabBarItem: View {
    let tab: TabItem
    let isSelected: Bool
    let namespace: Namespace.ID
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                ZStack {
                    if isSelected {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 45, height: 45)
                            .shadow(color: Color.blue.opacity(0.2), radius: 3, x: 0, y: 2)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(isSelected ? .white : .gray)
                        .scaleEffect(isSelected ? 1.0 : 0.9)
                }
                .frame(height: 45)
                .offset(y: isSelected ? -8 : 0)
                
                Text(tab.title)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(isSelected ? .blue : .gray)
                    .opacity(isSelected ? 1.0 : 0.6)
            }
            .frame(height: 70)
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: isSelected)
    }
}

//#Preview {
//    CurvedTabBarItem()
//}
