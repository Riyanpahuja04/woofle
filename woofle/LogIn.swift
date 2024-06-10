//
//  LogIn.swift
//  woofle
//
//  Created by Yu-Hsuan on 6/6/2024.
//

import SwiftUI

struct SecureInputView: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
    }
}

struct WelcomePage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    
    // Colors
    private let backgroundColorWoofle: Color = Color(red: 0.427, green: 0.6, blue: 0.518)
    private let overlayStrokeColor: Color = Color(red: 0.157, green: 0.165, blue: 0.216)
    private let loginBackgroundColors: Color = Color(red: 1, green: 0.62, blue: 0.29)
    private let additionTextBlack: Color = Color(red: 0.16, green: 0.16, blue: 0.22)
    private let iconBackgroundColor: Color = Color(red: 0.94, green: 0.94, blue: 0.94)
    
    
    var body: some View {
        ZStack {
            Color(backgroundColorWoofle)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                        .frame(height: 100)
                    Image("upperrightcolorblock")
                        .resizable()
                        .frame(width: 257, height: 312)
                }
                Spacer()
            }
            .ignoresSafeArea(edges: .top)
            
            VStack {
                Spacer()
                    .frame(height: -100)
                
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
                
                Spacer()
                    .frame(height: 180)
                
                Spacer()
                    .frame(height: 344)
            }
            
            VStack {
                Spacer()
                Image("loginsquare")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 390, height: 551)
            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Spacer()
                    .frame(height: 260)
                
                TextField("User Name or Email", text: $username)
                    .padding()
                    .frame(width: 296, height: 43)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(overlayStrokeColor, lineWidth: 1)
                    )
                    .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 30)
                
                SecureInputView("Password", text: $password)
                    .padding()
                    .frame(width: 296, height: 43)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(overlayStrokeColor, lineWidth: 1)
                    )
                    .padding(.horizontal, 47)
                
                Spacer()
                    .frame(height: 10)
                
                Button(action: {
                    
                }) {
                    Text("Forgot Password?")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#BDBDBD"))
                }
                .padding(.leading, 208)
                .padding(.trailing, 47)
                
                Spacer()
                    .frame(height: 20)
                
                Button(action: {
                    
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(width: 296, height: 50)
                        .background(loginBackgroundColors)
                        .cornerRadius(10)
                }
                
                Spacer()
                    .frame(height: 43)
                
                Text("Or")
                    .font(
                        .system(size: 20)
                        .weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(additionTextBlack)
                
                Spacer()
                    .frame(height: 43)
                
                HStack(spacing: 51) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(iconBackgroundColor)
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
                            .foregroundColor(iconBackgroundColor)
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
                            .foregroundColor(iconBackgroundColor)
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

                HStack {
                    Text("Don’t have an account?")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#282A37"))
                    
                    Button(action: {
                        // Action for Sign Up button
                    }) {
                        Text("Sign Up")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#4E5FF5"))
                    }
                }
                .multilineTextAlignment(.center)
            }
        }
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(
            .sRGB,
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0,
            opacity: 1.0
        )
    }
}

#Preview {
    WelcomePage()
}
