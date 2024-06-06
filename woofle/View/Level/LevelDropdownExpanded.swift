//
//  LevelDropdownExpanded.swift
//  woofle
//
//  Created by James Handley on 6/6/2024.
//

import SwiftUI

struct LevelDropdownExpanded: View {
    
    @State private var amDeployed: Bool = true
    
    // ViewModel will return these values once complete
    @State private var currentLevel: String = "LEVEL 0"
    @State private var levelName: String = "Playing “Stand By Me” Using Basic Chords On Guitar"
    @State private var goal: String = "Learn Basic Chords"
    @State private var description: String = "The four most common guitar chords are E-Minor, C, G and D. Youtube Tutorials would be a good place to start!"
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Rectangle()
                    .foregroundColor(_defaultBackgroundColor)
                    .cornerRadius(20)
                    .frame(width: .infinity, height: frameHeight())
                    Capsule()
                        .trim(from: 0.05, to: 0.45)
                        .foregroundColor(_defaultBackgroundColor)
                        .frame(width: 140, height: 120)
                        .padding(.vertical, -90)
                        .onTapGesture{
                            //TODO: CODE
                        }
                }
                .shadow(radius:2, x: 0, y: 4)
           
            VStack {
                
                ZStack {
                    
                    Spacer()
                    
                    Text(currentLevel)
                        .foregroundColor(_dropdownImageColor)
                        .font(
                            .system(size: 20)
                            .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Image(systemName: "ellipsis.circle")
                        .font(
                            .system(size: 22)
                            .weight(.medium)
                        )
                        .foregroundColor(_dropdownImageColor)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        .padding(.trailing, 50)
                        .onTapGesture {
                            //TODO: ADD FEATURE
                        }
                    
                }.padding(.top, 30)
                
                Text(levelName)
                    .foregroundColor(_dropdownImageColor)
                    .font(
                        .system(size: 20)
                        .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                HStack {
                    
                    Spacer()
                    
                    VStack() {
                        ZStack {
                            Rectangle()
                                .frame(width: .infinity, height: 50)
                                .foregroundColor(_greenHeaderColor)
                                .scaledToFill()
                            
                            Text(goal)
                                .frame(width: .infinity, height: 50)
                                .font(
                                    .system(size: 20)
                                    .weight(.medium)
                                )
                                .background(_greenHeaderColor)
                                .cornerRadius(10)
                                .foregroundColor(_defaultBackgroundColor)
                        }
                        
                        Text(description)
                            .frame(width: .infinity, height: 100)
                            .font(
                                .system(size: 15)
                            )
                            .padding(.horizontal, 30)
                            .foregroundColor(_helpScreenTextColor)
                            .padding(.vertical, 5)
                            .padding(.bottom, 10)
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                    
                }
                
                HStack {
                    Spacer().frame(width: 80)
                    WoofleActionButton(text: "Complete") {
                        //TODO: ADD CODE
                    }.frame(width: .infinity, height: 60)
                    Spacer().frame(width: 80)
                }.padding(.bottom, 30)
                
                
            }
            
            Image(systemName: "chevron.up")
                .font(.title)
                .padding(.horizontal, 30)
                .foregroundColor(_dropdownImageColor)
                .padding(.top, frameHeight() + 20)
                
        }
        .ignoresSafeArea()
    }
    
    
    // Temp colors until global color variables are made (just for my reference)
    private let _grayColor: Color = (Color(red: 189/255, green: 189/255, blue: 189/255))
    private let _orangeColor: Color = (Color(red: 255/255, green: 157/255, blue: 74/255))
    private let _defaultBackgroundColor: Color = Color(red: 255/255, green: 253/255, blue: 248/255)
    private let _buttonGrey: Color = Color(red: 225/255, green: 225/255, blue: 225/255)
    private let _currentPageIndicatorColor: Color = Color(red: 75/255, green: 134/255, blue: 131/255)
    private let _helpScreenTextColor: Color = Color(red: 0.16, green: 0.16, blue: 0.21)
    private let _dropdownImageColor: Color = Color(red: 0.28, green: 0.29, blue: 0.43)
    private let _greenHeaderColor: Color = Color(red: 0.43, green: 0.6, blue: 0.59)
    private let _teal: Color = Color(red: 0.43, green: 0.6, blue: 0.59)
    // END TEMP COLORS
    
    
    func frameHeight() -> CGFloat {
        if amDeployed { return 430 }
        else { return 240 }
    }
    
}

#Preview {
    LevelDropdownExpanded()
}
