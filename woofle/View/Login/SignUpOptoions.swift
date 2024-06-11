//
//  SignUpOptoions.swift
//  woofle
//
//  Created by Yu-Hsuan on 11/6/2024.
//

import SwiftUI

struct SignUpOptoions: View {
    
    var body: some View {
        
        Text("Or")
            .font(
                Font.custom("SF Pro", size: 20)
                    .weight(.medium)
            )
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.22))
        
        Spacer()
            .frame(height: 43)
        
        HStack(spacing: 51) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .frame(width: 49, height: 49)
                    .cornerRadius(10)
                
                Button(action: {
                }) {
                    Image("googleicon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30.46, height: 30.46)
                }
            }
            .padding(.leading, 70)
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .frame(width: 49, height: 49)
                    .cornerRadius(10)
                
                Button(action: {
                }) {
                    Image("appleicon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30.46, height: 30.46)
                }
            }
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                    .frame(width: 49, height: 49)
                    .cornerRadius(10)
                
                Button(action: {
                }) {
                    Image("facebookicon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                }
            }
            .padding(.trailing, 60)
            
            
        }
        
        
        Spacer()
            .frame(height: 40)


    }
}

#Preview {
    SignUpOptoions()
}
