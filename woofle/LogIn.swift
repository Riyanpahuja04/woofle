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

struct LogInPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoading = false
    @State private var canNavigate = false
    
    // Colors
    private let overlayStrokeColor: Color = Color(red: 0.157, green: 0.165, blue: 0.216)
    private let loginBackgroundColors: Color = Color(red: 1, green: 0.62, blue: 0.29)
    private let additionTextBlack: Color = Color(red: 0.16, green: 0.16, blue: 0.22)
    private let iconBackgroundColor: Color = Color(red: 0.94, green: 0.94, blue: 0.94)
    
    var body: some View {
        ZStack {
            Image("LogInBackground")
                .resizable()
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
                    .frame(height: 300)

                Rectangle()
                    .foregroundColor(Color(red: 1, green: 0.99, blue: 0.97))
                    .frame(width: 392, height: 592)
                    .cornerRadius(50)
                
                Spacer()
            }
            
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
                    canNavigate = true
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(width: 296, height: 50)
                        .background(loginBackgroundColors)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $canNavigate) {
                    nameInputScreen()
                }
                
                Spacer()
                    .frame(height: 43)
 
                SignUpOptoions()
                
                Spacer()
                    .frame(height: 20)

                HStack {
                    Text("Don’t have an account?")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#282A37"))
                    
                    Button(action: {
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

#Preview {
    LogInPage()
}
