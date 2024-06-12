//
//  SignUp.swift
//  woofle
//
//  Created by Yu-Hsuan on 7/6/2024.
//

import SwiftUI

struct SecureInputViewSignUp: View {
    
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

struct SignUpPage: View {
    @State private var email: String = ""
    @State private var reEnterPassword: String = ""
    @State private var password: String = ""
    @State private var passwordError = false
    @StateObject private var viewModel = AuthViewModel.shared
    
    var body: some View {
        ZStack {
            Color(red: 0.427, green: 0.6, blue: 0.518)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                        .frame(height: 100)
                    Image("upperrightcolorblock2")
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
                            Image("logo2")
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
                Image("loginsquare2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
            }
            .ignoresSafeArea(edges: .bottom)
            
            VStack {
                Spacer()
                    .frame(height: 200)
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .frame(width: 296, height: 43)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.157, green: 0.165, blue: 0.216), lineWidth: 1)
                    )
                    .padding(.horizontal, 40)
                
                Spacer()
                    .frame(height: 20)
                
                SecureInputViewSignUp("Password", text: $viewModel.password)
                    .padding()
                    .frame(width: 296, height: 43)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.157, green: 0.165, blue: 0.216), lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                
                Spacer()
                    .frame(height: 15)
                
                SecureInputViewSignUp("Re-enter password", text: $reEnterPassword)
                    .padding()
                    .frame(width: 296, height: 43)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.157, green: 0.165, blue: 0.216), lineWidth: 1)
                    )
                    .padding(.horizontal, 47)
                
                if passwordError {
                    Text("Password doesn't match!")
                        .foregroundStyle(Color.red)
                        .font(.caption)
                        .padding(.trailing, 145)
                }
                
                Spacer()
                    .frame(height: 20)
                
                Button(action: {
                    
                }) {
                    Text("Forgot Password?")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#BDBDBD"))
                }
                .padding(.leading, 208)
                .padding(.trailing, 40)
                
                Spacer()
                    .frame(height: 15)
                
                Button(action: {
                    if(viewModel.password != reEnterPassword) {
                        passwordError = true
                    } else {
                        passwordError = false
                        if viewModel.isInputValid() {
                            viewModel.signUp()
                        }
                    }
                }) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(width: 296, height: 50)
                        .background(Color(red: 1, green: 0.62, blue: 0.29))
                        .cornerRadius(10)
                }
                
                Spacer()
                    .frame(height: 30)
 
                SignUpOptoions()
                
                Spacer()
                    .frame(height: 15)

                HStack {
                    Text("Already have an account?")
                        .font(Font.system(size: 16))
                        .foregroundColor(Color(hex: "#282A37"))
                    
                    NavigationLink(destination: SignUpPage()) {
                        Text("Sign Up")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#4E5FF5"))
                    }
                }
                .multilineTextAlignment(.leading)
            }
            .navigationDestination(isPresented: $viewModel.isAuthenticated) {
                OnboardingView()
            }
        }
    }
}

#Preview {
    SignUpPage()
}
