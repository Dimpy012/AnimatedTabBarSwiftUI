//
//  AnimatedTabBar.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 18/07/25.
//

import SwiftUI

struct AnimatedTabBar: View {
    @State private var selectedTab = 0
    @Namespace private var namespace
    
    let tabs = [
        TabItem(icon: "house.fill", title: "Home"),
        TabItem(icon: "magnifyingglass", title: "Search"),
        TabItem(icon: "heart.fill", title: "Favorites"),
        TabItem(icon: "person.fill", title: "Profile")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Content area - shows different views based on selected tab
            Group {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    SearchView()
                case 2:
                    FavoritesView()
                case 3:
                    ProfileView()
                default:
                    HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.easeInOut(duration: 0.3), value: selectedTab)
            
            // Tab bar
            HStack(spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    TabBarItem(
                        tab: tabs[index],
                        isSelected: selectedTab == index,
                        namespace: namespace
                    ) {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            selectedTab = index
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
            )
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    AnimatedTabBar()
}
