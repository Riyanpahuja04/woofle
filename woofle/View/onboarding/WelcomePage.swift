//
//  WelcomePage.swift
//  woofle
//
//  Created by Yu-Hsuan on 6/6/2024.
//

import SwiftUI

struct _WelcomePage: View {
    @StateObject var firestoreService = FirestoreService.shared
    @State private var navigateToLogin = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.427, green: 0.6, blue: 0.518)
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                        .frame(height: 240)
                    HStack {
                        Spacer()
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 422, height: 316)
                            .background(
                                Image("aura")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 422, height: 316)
                                    .clipped()
                            )
                            .offset(x: -29, y: -10)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 278)
                }

                VStack {
                    HStack {
                        Spacer()
                        Image("upperrightcolorblock")
                            .resizable()
                            .frame(width: 257, height: 312)
                    }
                    Spacer()
                }
                .ignoresSafeArea(edges: .top)

                VStack {
                    Spacer()
                    HStack {
                        Image("bottomleftcolorblock")
                            .resizable()
                            .frame(width: 248, height: 426)
                        Spacer()
                    }
                }
                .ignoresSafeArea(edges: .bottom)

                VStack {
                    Spacer()
                        .frame(height: 116)
                    HStack {
                        Spacer()
                            .frame(width: 40, height: 10)
                        Image("woofle-standing")
                            .resizable()
                            .frame(width: 220, height: 241)
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                            .frame(width: 40, height: 10)
                    }
                    Spacer()
                        .frame(height: 5)
                    HStack {
                        Spacer()
                            .frame(width: 72.1, height: 30)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 245, height: 107)
                            .background(
                                Image("logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 245, height: 107)
                                    .clipped()
                            )
                            .rotationEffect(Angle(degrees: 2.07))
                        Spacer()
                            .frame(width: 72.2, height: 40)
                    }
                    Text("Step Out, Connect, Thrive")
                        .font(Font.custom("Darumadrop One", size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: 60)
                    
                    LoadingIndicator()
                    Spacer()
                        .frame(height: 394 - 25)
                }
                .navigationDestination(isPresented: $navigateToLogin ) {
                    LogInPage()
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
        .onAppear {
            firestoreService.fetchAllGoals{ completion in
                navigateToLogin = completion
                
            }
        }
    }
}

struct LoadingIndicator: View {
    @State private var isLoading: Bool = false

        var body: some View {
            ZStack {
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 3)
                    .frame(width: 30, height: 30)
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(Color(#colorLiteral(red: 0.250980406999588, green: 0.4117647111415863, blue: 0.5372549295425415, alpha: 1)), lineWidth: 3)
                    .frame(width: 30, height: 30)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            }
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    isLoading = true
                }
            }
        }
}

#Preview(body: {
    _WelcomePage()
})
        

