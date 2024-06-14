//
//  nameInputScreen.swift
//  woofle
//
//  Created by James Handley on 5/6/2024.
//

import SwiftUI

struct nameInputScreen: View {
    
    @State private var userInputText: String = ""
    @State private var canNavigate = false
    
    var body: some View {
        VStack {
            
            Group {
                
                Spacer().frame(minHeight: 0, maxHeight: 40)
                
                HStack {
                    Spacer()
                    Image(systemName: "questionmark.circle")
                        .scaledToFit()
                        .font(.largeTitle)
                        .padding(.horizontal, 30)
                }.opacity(0)
                
            }
            
            Image("Woofle-Hello")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 10)
            
            
            Text("What is your name?")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .padding(.vertical, 15)
            
            HStack {
                
                Spacer(minLength: 80)
                
                TextField("Please type in your name...", text: $userInputText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(4)
                
                Spacer(minLength: 80)
                
            }
            
            HStack {
                
                Spacer(minLength: 80)
                
                Text("\(userInputText.count)/30").font(.caption).padding(.trailing, 85.0)
                    .foregroundColor(characterCounterColor())
                
            }
            
            Spacer()
            
            HStack {
                
                Spacer().frame(minWidth: 0, maxWidth: 25)
                
                WoofleActionButton(text: "Submit") {
                    if !userInputText.isEmpty && userInputText.count <= 60 {
                        canNavigate = true
                    }
                }
                
                Spacer().frame(minWidth: 0, maxWidth: 25)
                
            }
            .padding(.bottom, 20)
            
            HStack(alignment: .center) {
                Circle().fixedSize().foregroundColor(_currentPageIndicatorColor)
                Circle().fixedSize().foregroundColor(_buttonGrey)
                Circle().fixedSize().foregroundColor(_buttonGrey)
            }.padding(.bottom, 10)
            
            .navigationDestination(isPresented: $canNavigate) {
                WhyDownloadScreen()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .background(_defaultBackgroundColor)
    }
    
    private let _grayColor: Color = (Color(red: 189/255, green: 189/255, blue: 189/255))
    private let _orangeColor: Color = (Color(red: 255/255, green: 157/255, blue: 74/255))
    private let _defaultBackgroundColor: Color = Color(red: 255/255, green: 253/255, blue: 248/255)
    private let _buttonGrey: Color = Color(red: 225/255, green: 225/255, blue: 225/255)
    private let _currentPageIndicatorColor: Color = Color(red: 75/255, green: 134/255, blue: 131/255)
    private let _helpScreenTextColor: Color = Color(red: 0.16, green: 0.16, blue: 0.21)
    
    func currentButtonColor() -> Color {
        if !userInputText.isEmpty && userInputText.count <= 30 {
            return _orangeColor
        } else {
            return _grayColor
        }
    }
    
    func characterCounterColor() -> Color {
        if userInputText.count > 30 {
            return .red
        } else {
            return .black
        }
    }
}

#Preview {
    nameInputScreen()
}

