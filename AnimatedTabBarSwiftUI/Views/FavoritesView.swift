//
//  FavoritesView.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 11/07/25.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.fill")
                .font(.system(size: 60))
                .foregroundColor(.red)
            
            Text("Favorites")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your liked items appear here")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            LazyVStack(spacing: 10) {
                ForEach(1...5, id: \.self) { item in
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        Text("Favorite item \(item)")
                            .font(.body)
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red.opacity(0.05))
    }
}

#Preview {
    FavoritesView()
}
