//
//  ActivitySelection.swift
//  woofle
//
//  Created by Riyan Pahuja on 3/6/2024.
//

import SwiftUI

struct ActivitySelection: View {
    // TODO: fetch api data to show
    var body: some View {
        ZStack {
            Image("ActivitySelectionBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack(spacing: 5) {
                // TODO: populate data from api
                Text("Level 0")
                    .font( .title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 71 / 255, green: 75 / 255, blue: 109 / 255))
                
                
                // TODO: populate data from api
                Text("Playing “Stand By Me” Using Basic Chords On Guitar")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(red: 40 / 255, green: 42 / 255, blue: 55 / 255))
                    .padding(.horizontal, 50)
                    .multilineTextAlignment(.center)
                
                Text("Let's break it down!")
                    .font(.title3)
                    .foregroundStyle(Color(red: 23 / 255, green: 23 / 255, blue: 23 / 255))
                    .fontWeight(.medium)
                
                HStack {
                    Text("Select Your Activity")
                        .foregroundStyle(Color(red: 174 / 255, green: 169 / 255, blue: 169 / 255))
                    .fontWeight(.regular)
                    .padding(.leading, 120)
                    .padding(.trailing, 35)
                    
                    
                    // TODO: Add tappable functionality
                    Button(action: {}) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .padding(.trailing, 50)
                            .foregroundStyle(Color(red: 71 / 255, green: 75 / 255, blue: 109 / 255))
                    }
                }
                
                Spacer()
                
                ForEach(0..<3) { el in
                    Button(action: {}) {
                        // TODO: Add tappable functionality
                        Text("Update Profile Picture")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                            .foregroundColor(Color(red: 40/255, green: 42/255, blue: 55/255))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 50)
                    .padding(.bottom)
                }
                
                Spacer()
                
                Button(action: {}) {
                    // TODO: Add tappable functionality
                    Text("Accept")
                        .padding(.all, 35)
                        .foregroundStyle(Color(red: 40/255, green: 42/255, blue: 55/255))
                        .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                        
                    
                }
                .clipShape(Circle())
                
               Spacer()
            }
            .safeAreaPadding(.top, 100)
        }
    }
}

#Preview {
    ActivitySelection()
}
