//
//  FloatingTabBar.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 18/07/25.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house"
    case search = "magnifyingglass"
    case add = "plus"
    case notifications = "bell"
    case profile = "person"
}

struct FloatingTabBar: View {
    @Binding var selectedTab: Tab
    @Namespace private var bubbleAnim
    @State private var tabPositions: [Tab: CGFloat] = [:]
    @State private var bounce: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            // Content area
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .search:
                    SearchView()
                case .add:
                    AddView()
                case .notifications:
                    FavoritesView()
                case .profile:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Tab Bar
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    if let centerX = tabPositions[selectedTab] {
                        CustomTabShape(centerX: centerX)
                            .fill(Color.white)
                            .shadow(radius: 5)
                            .frame(height: 80)
//                            .animation(.easeInOut(duration: 0.3), value: selectedTab)
                            .animation(.spring(duration: 0.3), value: selectedTab)
                    }

                    HStack {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            GeometryReader { geo in
                                ZStack {
                                    if tab == selectedTab {
                                        ZStack {
                                            Circle()
                                                .fill(Color.blue)
                                                .frame(width: 60, height: 60)
                                                .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)

                                            Image(systemName: tab.rawValue)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.white)
                                        }
                                        .offset(y: -30)
                                    } else {
                                        Image(systemName: tab.rawValue)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .offset(y: tab == selectedTab ? -30 : 0)
                                .onAppear {
                                    tabPositions[tab] = geo.frame(in: .global).midX
                                }
                                .onChange(of: selectedTab) { _ in
                                    tabPositions[tab] = geo.frame(in: .global).midX
                                }
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        selectedTab = tab
                                    }
                                }
                            }
                            .frame(height: 70)
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }

}

#Preview {
    FloatingTabBar(selectedTab: .constant(.home))
}
