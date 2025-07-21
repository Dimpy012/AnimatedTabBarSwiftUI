//
//  SearchView.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 11/07/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 60))
                .foregroundColor(.orange)
            
            Text("Search")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Search here...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            
            Text("Find what you're looking for")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.opacity(0.05))
    }
}

#Preview {
    SearchView()
}
