//
//  nameInputScreen.swift
//  woofle
//
//  Created by James Handley on 5/6/2024.
//

import SwiftUI

struct nameInputScreen: View {
    
    @State private var userInputText: String = ""
    
    var body: some View {
        VStack {
            
            // Using transparent image ENSURES the padding is consistant across screens if the info button is shown or not
            // Performance overhead should be low since the image will need to be loaded for the next pages anyways
            // Its not spaghetti code its code resembling a fine italian culinary experience (There is a difference!)
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
            
                Image("woofle 1")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 64)
                
                
                Text("What is your name?")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                
                // Input HSTACK
                HStack {
                    
                    Spacer(minLength: 80)
                    
                    TextField("Please type in your name...", text: $userInputText, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(4)
                    
                    Spacer(minLength: 80)
                    
                }
                
                // Character Counter HSTACK
                HStack {
                    
                    Spacer(minLength: 80) // Same spacer as Input Box to ensure they always line up
                    
                    Text("\(userInputText.count)/30").font(.caption).padding(.trailing, 85.0)
                        .foregroundColor(characterCounterColor())
                    
                }
                
                Spacer()
                
                // Submit Button HSTACK
                HStack {
                    
                    Spacer().frame(minWidth: 0, maxWidth: 25)
                    
                    Button("Submit")
                    {
                        
                        if !userInputText.isEmpty {
                            
                            // TODO: Call to backend API, save name as Global Variable for use later
                        }
                        
                    }
                    .frame(minWidth: 160, maxWidth: .infinity)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 14)
                    .foregroundColor(.white)
                    .background(currentButtonColor())
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .cornerRadius(8)
                    .scaledToFit()
                    
                    Spacer().frame(minWidth: 0, maxWidth: 25)
                    
                }
                .padding(.bottom, 20)
                
                HStack(alignment: .center) {
                    Circle().fixedSize().foregroundColor(_currentPageIndicatorColor)
                    Circle().fixedSize().foregroundColor(_buttonGrey)
                    Circle().fixedSize().foregroundColor(_buttonGrey)
                }.padding(.bottom, 10)
                
            }
            // Background colour for the page
            .background(_defaultBackgroundColor)
            
    }
    
    // Temp colors until global color variables are made (just for my reference)
    private let _grayColor: Color = (Color(red: 189/255, green: 189/255, blue: 189/255))
    private let _orangeColor: Color = (Color(red: 255/255, green: 157/255, blue: 74/255))
    private let _defaultBackgroundColor: Color = Color(red: 255/255, green: 253/255, blue: 248/255)
    private let _buttonGrey: Color = Color(red: 225/255, green: 225/255, blue: 225/255)
    private let _currentPageIndicatorColor: Color = Color(red: 75/255, green: 134/255, blue: 131/255)
    private let _helpScreenTextColor: Color = Color(red: 0.16, green: 0.16, blue: 0.21)
    // END TEMP COLORS
    
    func currentButtonColor() -> Color {
        
        if !userInputText.isEmpty && userInputText.count < 31
        { return _orangeColor }
        
        else
        { return _grayColor }
        
    }
    
    func characterCounterColor() -> Color {
        
        if userInputText.count > 30 
        { return .red }
        
        else
        { return .black }
        
    }
    
}


#Preview {
    nameInputScreen()
}
