//
//  Onboarding.swift
//  woofle
//
//  Created by Archita Belvadi on 6/6/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    private var backgroundColor: Color = Color(red: 0.63, green: 0.78, blue: 0.68)
    private var pageviewcontroller : Color = Color(red: 0.29, green: 0.53, blue: 0.51)
    private var pageviewcontrollerdisabled : Color = Color(red: 0.88, green: 0.88, blue: 0.88)
    
    var body: some View {
        ZStack {
            Color(backgroundColor)
            VStack {
                Spacer()
                
                Image("Woofle-text")
                    .padding(.top, 40)
                    .padding(.leading, 0)
                    .padding(.vertical, 0)
                    .frame(height: 250, alignment: .leading)
                    
                
                Text("We are here to help people who want to discover new personal experiences. ")
                  .font(.system(size: 22))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .padding(.horizontal, 30)
                  .padding(.top, 10)
                            
                Spacer()
                            
                Image("Image-onboarding")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .padding(.bottom, 20)
                            

                WoofleActionButton(text: "Next") {
                    
                }
                .padding(.horizontal, 50)
                .padding (.vertical, 30)
                            
                 HStack(spacing: 10) {
                 Circle()
                 .fill(pageviewcontroller)
                 .frame(width: 10, height: 10)
                                
                 Circle()
                 .fill(pageviewcontrollerdisabled)
                 .frame(width: 10, height: 10)
                            }
                 .padding(.bottom, 40)
                        }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}