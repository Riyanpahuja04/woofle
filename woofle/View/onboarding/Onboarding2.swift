//
//  Onboarding2.swift
//  woofle
//
//  Created by Archita Belvadi on 6/6/2024.
//

import SwiftUI

struct Onboarding2View: View {
    
    private var backgroundColor: Color = Color(red: 0.63, green: 0.78, blue: 0.68)
    private var pageindicatorcolor: Color = Color(red: 0.29, green: 0.53, blue: 0.51)
    private var pageindicatorcolordisabled: Color = Color(red: 0.88, green: 0.88, blue: 0.88)
    @State private var isNavigationEnabled: Bool = false
    
    var body: some View {
        
        ZStack {
            Color(backgroundColor)
            VStack {
                Spacer()
                
                VStack {
                    Image("Thrive-text")
                        .padding(.top, 40)
                        .padding(.leading, 0)
                        .padding(.vertical, 0)
                        .frame(height: 250, alignment: .leading)
                    
                    Text("Take baby steps, connect with others, and achieve your goals effortlessly.")
                        .font(Font.system(size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .padding(.top, 0)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Spacer()
                
                Image("Image-onboarding2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 20)
                
                WoofleActionButton(text: "Let's Start!", action: {
                    isNavigationEnabled.toggle()
                })
                .padding(.horizontal, 50)
                .padding(.vertical, 30)
                
                HStack(spacing: 10) {
                    
                    Circle()
                        .fill(pageindicatorcolordisabled)
                        .frame(width: 10, height: 10)
                    
                    Circle()
                        .fill(pageindicatorcolor)
                        .frame(width: 10, height: 10)
                    
                }
                .padding(.bottom, 40)
            }
            .navigationDestination(isPresented: $isNavigationEnabled) {
                nameInputScreen()
            }
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Onboarding2View()
}
