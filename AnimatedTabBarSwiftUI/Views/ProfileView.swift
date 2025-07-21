//
//  ProfileView.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 11/07/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.fill")
                .font(.system(size: 60))
                .foregroundColor(.purple)
            
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 15) {
                ProfileRow(title: "Name", value: "John Doe")
                ProfileRow(title: "Email", value: "john@example.com")
                ProfileRow(title: "Phone", value: "+1 234 567 8900")
                ProfileRow(title: "Location", value: "San Francisco, CA")
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple.opacity(0.05))
    }
}

struct ProfileRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.subheadline)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    ProfileView()
}
