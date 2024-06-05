//
//  whyDownloadScreen.swift
//  woofle
//
//  Created by James Handley on 5/6/2024.
//

import SwiftUI

struct whyDownloadScreen: View {
    
    @State private var opacityMaskValue: Double = 1
    @State private var backgroundMaskColor: Color = Color(red: 255/255, green: 253/255, blue: 248/255)
    @State private var userSelectedAny: Bool = false
    @State private var showHelp: Bool = false
    @State private var selectedButtonState: [String: Bool] = ["Vibing": false, "Personal Growth": false, "Discover New Experience": false, "Fun": false, "Overcome My Fear": false]
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Spacer().frame(minHeight: 0, maxHeight: 40)
                
                // Info Button
                HStack {
                    Spacer()
                    Image(systemName: "questionmark.circle")
                        .scaledToFit()
                        .font(.largeTitle)
                        .padding(.horizontal, 30)
                        .onTapGesture {
                            if !showHelp {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    enableBackgroundMask()
                                    showHelp.toggle()
                                }
                            }
                        }
                }
                
                Image("woofle 1")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 64)
                
                
                Text("Why did you download\nWoofle?")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        
                        Text("+ Vibing")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(userSelectionButtonColor(buttonKey: "Vibing"))
                            .cornerRadius(28)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedButtonState["Vibing"]?.toggle()
                                }
                            }
                        
                        Text("+ Personal Growth")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(userSelectionButtonColor(buttonKey: "Personal Growth"))
                            .cornerRadius(28)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedButtonState["Personal Growth"]?.toggle()
                                }
                            }
                        
                    }
                    
                    HStack {
                        
                        Text("+ Discover New Experience")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(userSelectionButtonColor(buttonKey: "Discover New Experience"))
                            .cornerRadius(28)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedButtonState["Discover New Experience"]?.toggle()
                                }
                            }
                        
                    }
                    
                    HStack {
                        
                        Text("+ Fun")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(userSelectionButtonColor(buttonKey: "Fun"))
                            .cornerRadius(28)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedButtonState["Fun"]?.toggle()
                                }
                            }
                        
                        Text("+ Overcome My Fear")
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(userSelectionButtonColor(buttonKey: "Overcome My Fear"))
                            .cornerRadius(28)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedButtonState["Overcome My Fear"]?.toggle()
                                }
                            }
                        
                    }
                    
                }
                
                Spacer()
                Spacer()
                
                // Submit Button HSTACK
                HStack {
                    
                    Spacer().frame(minWidth: 0, maxWidth: 25)
                    
                    Button(currentButtonText())
                    {
                        
                        //TODO: Submit Selected Values to API for Data Collection
                        
                        // TODO: On non-error return from API, switch current scene to WhyDownloadScreen()
                        
                    }
                    .frame(minWidth: 160, maxWidth: .infinity)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 14)
                    .foregroundColor(.white)
                    .background(_orangeColor)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .cornerRadius(8)
                    .scaledToFit()
                    
                    Spacer().frame(minWidth: 0, maxWidth: 25)
                    
                }
                .padding(.bottom, 20)
                
                // Current Page (1 of 3) Icons
                HStack(alignment: .center) {
                    Circle().fixedSize().foregroundColor(_buttonGrey)
                    Circle().fixedSize().foregroundColor(_currentPageIndicatorColor)
                    Circle().fixedSize().foregroundColor(_buttonGrey)
                }
                .padding(.bottom, 10)
                
            }
            // Opacity Mask for Info Menu
            .mask(Rectangle().opacity(opacityMaskValue))
            // Background colour for the page
            .background(backgroundMaskColor)
            
            if showHelp {
                
                // Info Pane VSTACK
                VStack {
                    Text("What Brought us Together?").font(.system(size: 18)).bold()
                        .foregroundColor(_helpScreenTextColor)
                        .padding(.bottom, 10)
                        .padding(.top, 30)
                    
                    Text("We would love to know what made you interested in Woofle and the journey of discovery\n\nPlease select any of the available boxes which helps to describe why you chose to download Woofle.")
                        .font(.system(size: 16))
                        .foregroundColor(_helpScreenTextColor)
                        .padding(.horizontal, 40)
                    
                    Button("Got It!") {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            disableBackgroundMask()
                            showHelp.toggle()
                        }
                        
                    }
                    .foregroundColor(.white)
                    .bold()
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(_orangeColor)
                    .cornerRadius(10)
                    .padding()
                    
                    Spacer().frame(height: 20)
                    
                }
                .frame(minWidth: 200, maxWidth: 300)
                .background(.white)
                .cornerRadius(20)
                .padding()
                
            }
            
        }
            
    }
    
    // Temp colors until global color variables are made (just for my reference)
    private let _grayColor: Color = (Color(red: 189/255, green: 189/255, blue: 189/255))
    private let _orangeColor: Color = (Color(red: 255/255, green: 157/255, blue: 74/255))
    private let _defaultBackgroundColor: Color = Color(red: 255/255, green: 253/255, blue: 248/255)
    private let _buttonGrey: Color = Color(red: 225/255, green: 225/255, blue: 225/255)
    private let _currentPageIndicatorColor: Color = Color(red: 75/255, green: 134/255, blue: 131/255)
    private let _helpScreenTextColor: Color = Color(red: 0.16, green: 0.16, blue: 0.21)
    private let _unselectedButtonColor: Color = Color(red: 0.63, green: 0.75, blue: 0.68)
    private let _selectedButtonColor: Color = Color(red: 0.43, green: 0.6, blue: 0.59)
    // END TEMP COLORS
    
    func currentButtonText() -> String {
        
        if userSelectedAny
        { return "Submit" }
        
        else
        { return "Skip" }
        
    }
    
    func enableBackgroundMask() {
        backgroundMaskColor = _grayColor
        opacityMaskValue = 0.19
    }
    
    func disableBackgroundMask() {
        backgroundMaskColor = _defaultBackgroundColor
        opacityMaskValue = 1
    }
    
    func userSelectionButtonColor(buttonKey: String) -> Color {
        
        if selectedButtonState[buttonKey] ?? false
        { return _selectedButtonColor }
        
        else
        { return _unselectedButtonColor }
        
    }
    
}


#Preview {
    whyDownloadScreen()
}
