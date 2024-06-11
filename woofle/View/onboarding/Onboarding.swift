//
//  Onboarding.swift
//  woofle
//
//  Created by Archita Belvadi on 6/6/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    private var backgroundColor: Color = Color(red: 0.63, green: 0.78, blue: 0.68)
    private var pageindicator : Color = Color(red: 0.29, green: 0.53, blue: 0.51)
    private var pageindicatordisabled : Color = Color(red: 0.88, green: 0.88, blue: 0.88)
    @State private var isNavigationEnabled: Bool = false
    
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
                    
                    WoofleActionButton(text: "Next", action: {
                        isNavigationEnabled.toggle()
                    })
                    .padding(.horizontal, 50)
                    .padding(.vertical, 30)
                    
                    HStack(spacing: 10) {
                        Circle()
                            .fill(pageindicator)
                            .frame(width: 10, height: 10)
                        
                        Circle()
                            .fill(pageindicatordisabled)
                            .frame(width: 10, height: 10)
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationDestination(isPresented: $isNavigationEnabled) {
                Onboarding2View()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }


#Preview(body: {
    OnboardingView()
})

