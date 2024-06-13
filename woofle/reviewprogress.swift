//
//  reviewprogress.swift
//  woofle
//
//  Created by Yu-Hsuan on 12/6/2024.
//

import SwiftUI

struct reviewprogress: View {
    var body: some View {
        ZStack {
            Color(hex: "#FFFDF8").ignoresSafeArea()
            
            Image("greenmarker")
                .resizable()
                .frame(width: 224, height: 70)
                .offset(x: 0, y: -280)
                .padding(.horizontal, 84)
            
            Text("LEVEL 0")
                .font(
                    Font.custom("SF Pro", size: 20)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.22))
                .offset(x: 0, y: -285)
            
            Text("This is your moment. Enjoy it!")
                .font(
                    Font.custom("SF Pro", size: 16)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.21))
                .offset(x: 0, y: -240)
                .padding(.horizontal, 89)
            
            Image("reviewpolaroid")
                .resizable()
                .frame(width: 310, height: 327)
                .offset(x: 0, y: -27.75)
                .padding(.horizontal, 61)
            
            Image("polaroidsticker")
                .resizable()
                .frame(width: 135, height: 154)
                .offset(x: 120, y: -160)
                .padding(.horizontal, 245)
            
            Text("Learn Basic Chords")
                .font(
                    Font.custom("SF Pro", size: 20)
                        .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 201, alignment: .top)
                .offset(x: 0, y: 70)
            
            Text("-16/04/2024")
                .font(Font.custom("SF Pro", size: 15))
                .multilineTextAlignment(.trailing)
                .foregroundColor(.black)
                .offset(x: 80, y: 110)
            
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
                .frame(width: 25, height: 25)
                .offset(x: 0, y: 280)
                .padding(.bottom, 177)
        }
    }
}

#Preview {
    reviewprogress()
}
