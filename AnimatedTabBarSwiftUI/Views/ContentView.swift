//
//  ContentView.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 11/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedStyle = 0
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack {
            if selectedStyle == 0 {
                AnimatedTabBar()
            } else {
                ZStack(alignment: .bottom) {
                    Color.gray.opacity(0.1).ignoresSafeArea()
                    FloatingTabBar(selectedTab: $selectedTab)
                        .padding(.bottom, 10)
                }.edgesIgnoringSafeArea(.bottom)
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button("Switch Style") {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            selectedStyle = selectedStyle == 0 ? 1 : 0
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

