//
//  reviewprogress.swift
//  woofle
//
//  Created by Yu-Hsuan on 12/6/2024.
//

import SwiftUI

struct reviewprogress: View {
    
    @State var objectData: SavedExperience
    
    var body: some View {
        ZStack {
            Color(hex: "#FFFDF8").ignoresSafeArea()
            
            Image("greenmarker")
                .resizable()
                .frame(width: 224, height: 70)
                .offset(x: 0, y: -280)
                .padding(.horizontal, 84)
            
            Text("LEVEL \(objectData.level)")
                .font(.system(size: 16).weight(.bold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.22))
                .offset(x: 0, y: -285)
            
            Text("This is your moment. Enjoy it!")
                .font(.system(size: 16).weight(.medium))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.21))
                .offset(x: 0, y: -240)
                .padding(.horizontal, 89)
            
            ZStack(){
                
                Image("emptypolariod 1")
                
                Group {
                    Image(uiImage: UIImage(data: (objectData.image ?? UIImage(named: "filler-image")?.sd_imageData())!)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 256, height: 210)
                }
                .frame(width: 256, height: 210)
                .offset(x: 0, y: -40)
                .padding(.horizontal, 200)
                
            }
                
            Image("polaroidsticker")
                .resizable()
                .frame(width: 135, height: 154)
                .offset(x: 120, y: -160)
                .padding(.horizontal, 245)
            
            Text(objectData.title)
                .font(.system(size: 20).weight(.semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 201, alignment: .top)
                .offset(x: 0, y: 80)
            
            Text("- \(objectData.date.formatted())")
                .font(.system(size: 16))
                .multilineTextAlignment(.trailing)
                .foregroundColor(.black)
                .offset(x: 50, y: 120)
            
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
                .frame(width: 25, height: 25)
                .offset(x: 0, y: 300)
                .padding(.bottom, 177)
        }
    }
}

#Preview {
    reviewprogress(objectData: SavedExperience(level: 1, title: "Title", mood: 1, date: Date()))
}
