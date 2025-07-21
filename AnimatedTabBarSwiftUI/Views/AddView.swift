//
//  AddView.swift
//  AnimatedTabBarSwiftUI
//
//  Created by Dimpy Patel on 18/07/25.
//

import SwiftUI

struct AddView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)
            
            Text("Add New")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Create something new!")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            VStack(spacing: 15) {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "photo")
                        Text("Add Photo")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "video")
                        Text("Add Video")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "text.alignleft")
                        Text("Add Text")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green.opacity(0.05))
    }
}

#Preview {
    AddView()
}
