//
//  goalInputScreen.swift
//  woofle
//
//  Created by James Handley on 4/6/2024.
//

import SwiftUI

struct goalInputScreen: View {
    
    
    // Temp colors until global color variables are made (just for my reference)
    private let _grayColor: Color = (Color(red: 189/255, green: 189/255, blue: 189/255))
    private let _orangeColor: Color = (Color(red: 255/255, green: 157/255, blue: 74/255))
    private let _defaultBackgroundColor: Color = Color(red: 255/255, green: 253/255, blue: 248/255)
    // END TEMP COLORS
    
    @State private var userInputText: String = ""
    @State private var opacityMaskValue: Double = 1
    @State private var backgroundMaskColor: Color = Color(red: 255/255, green: 253/255, blue: 248/255)
    @State private var showHelp: Bool = false
    
    func currentButtonColor() -> Color {
        if !userInputText.isEmpty && userInputText.count < 61 {
            
            return _orangeColor
            
            // Function Call to Backend
            // Networking with ChatGPT, if prompt is compatable, return true
            
            // If Return Value == True
            // Switch to next page
            // Else; Try Again and show Error
            
        }
        
        else {
            return _grayColor
        }
    }
    
    func characterCounterColor() -> Color {
        
        if userInputText.count > 60 {
            return .red
        }
        
        else {
            return .black
        }
        
    }
    
    func enableBackgroundMask() {
        backgroundMaskColor = _grayColor
        opacityMaskValue = 0.19
    }
    
    func disableBackgroundMask() {
        backgroundMaskColor = _defaultBackgroundColor
        opacityMaskValue = 1
    }
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Spacer().frame(minHeight: 0, maxHeight: 40)
                
                HStack {
                    Spacer()
                    Image(systemName: "questionmark.circle")
                        .scaledToFit()
                        .font(.largeTitle)
                        .padding(.horizontal, 30)
                        .onTapGesture {
                            if !showHelp {
                                enableBackgroundMask()
                                showHelp.toggle()
                            }
                        }
                }
                
                Image("woofle 1")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 64)
                
                
                Text("What is your Goal?")
                    .font(
                        Font.custom("SF Pro", size: 24)
                            .weight(.semibold))
                    .padding(.vertical, 15)
                
                
                HStack { // Contains Input and Dice Button
                    
                    Spacer(minLength: 80)
                    
                    
                    TextField("Please type in your goal...", text: $userInputText, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(4)
                    
                    Image(systemName: "dice.fill")
                        .scaledToFit()
                        .font(.title)
                        .padding(.trailing, 30.0)
                        .padding(.leading, 5)
                    
                    
                } // END Text Input and Dice Button HStack
                
                HStack {
                    
                    Spacer(minLength: 80) // Same spacer as Input Box to ensure they always line up
                    
                    Text("\(userInputText.count)/60").font(.caption).padding(.trailing, 85.0)
                        .foregroundColor(characterCounterColor())
                    
                }
                
                
                Spacer()
                
                HStack { // Submit Button and Spacing
                    
                    Spacer().frame(minWidth: 0, maxWidth: 25)
                    
                    Button("Submit")
                    {
                        
                        if !userInputText.isEmpty {
                            
                            // Function Call to Backend
                            // Networking with ChatGPT, if prompt is compatable, return true
                            
                            // If Return Value == True
                            // Switch to next page
                            // Else; Try Again and show Error
                            
                        }

                    }
                    .frame(minWidth: 160, maxWidth: .infinity)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 14)
                    .foregroundColor(.white)
                    .background(currentButtonColor())
                    .font(
                        Font.custom("SF Pro", size: 16)
                            .weight(.semibold))
                    .cornerRadius(8)
                    .scaledToFit()
                    
                    Spacer().frame(minWidth: 0, maxWidth: 25)
                    
                } // END Submit Button HStack
                
            }
            // Opacity Mask for Info Menu
            .mask(Rectangle().opacity(opacityMaskValue))
            // Background colour for the page
            .background(backgroundMaskColor)
            
            if showHelp {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 220)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        
                        
                    VStack {
                        Text("What you want to discover?").font(.system(size: CGFloat(18))).bold()
                            .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.21))
                            .padding(.vertical, 10)
                        
                        Text("What are the things you have wanted to try for so long but have not put into practice? \nWe encourage you to log in your goal and discover new experience by stepping out of the comfort zone. \nEnjoy your discovery journey!")
                            .font(.system(size: CGFloat(16)))
                            .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.21))
                            .padding(.horizontal, 80)
                        
                        Button("Got It!") {
                            disableBackgroundMask()
                            showHelp.toggle()
                        }
                        .foregroundColor(.white)
                        .bold()
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(_orangeColor)
                        .cornerRadius(10)
                        .padding()
                    }
                    
                }.animation(.easeIn, value: showHelp)
            }
        }
        
    }
    
}


#Preview {
    goalInputScreen()
}
