//
//  TabBarItem.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 18/07/25.
//

import SwiftUI

struct TabBarItem: View {
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
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 50, height: 50)
                            .matchedGeometryEffect(id: "selectedTab", in: namespace)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(isSelected ? .white : .gray)
                        .scaleEffect(isSelected ? 1.2 : 1.0)
                }
                .frame(height: 50)
                
                Text(tab.title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(isSelected ? .blue : .gray)
                    .opacity(isSelected ? 1.0 : 0.7)
                    .scaleEffect(isSelected ? 1.0 : 0.9)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: isSelected)
    }
}

//#Preview {
//    TabBarItem()
//}
