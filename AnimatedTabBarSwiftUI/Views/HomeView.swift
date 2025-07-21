//
//  HomeView.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 11/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "house.fill")
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Welcome to your home page!")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.05))
    }
}

#Preview {
    HomeView()
}
