//
//  MapView.swift
//  woofle
//
//  Created by Megan Nguyen on 5/6/2024.
//

import SwiftUI
import ConfettiSwiftUI

struct woofleCompletionScreen: View {
    @State private var bouncing = false
    @State private var counter: Int = 0
    @Binding var backgroundBlur: CGFloat
    @ObservedObject var dropdownViewModel: DropdownViewModel
    
    var body: some View {
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(_defaultBackgroundColor)
                .frame(height: 240)
                .padding(30)
                .shadow(radius: 5)
                .onAppear(perform: {
                    backgroundBlur = 5
                })

                ZStack {
                    Image("woofle-trophy")
                        .resizable()
                        .frame(width: 200, height: 250)
                        .shadow(color: .circleYellow, radius: 20)
                        .offset(y: bouncing ? -200 : -180)
//                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: bouncing)
                        .onAppear {
                            self.bouncing.toggle()
                            self.counter += 1
                        }
                        .confettiCannon(counter: $counter, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                }

            VStack {
                Rectangle()
                    .frame(height:10)
                    .foregroundColor(.clear)
                Text("Congratulations!")
                    .font(Font.custom("Darumadrop One", size: 32))
                    .foregroundColor(.backgroundGreen)
                Text("Woofle says you're doing amazing.")
                    .font(.subheadline)
                Rectangle()
                    .frame(height:15)
                    .foregroundColor(.clear)
                
                HStack {
                    Rectangle()
                        .frame(width: 40,height:10)
                        .foregroundColor(.clear)
                    WoofleActionButton(text: "Next task!", action: {
                        dropdownViewModel.completionOverlayFlag = false
                        withAnimation(.snappy(duration: 0.4)) {
                            backgroundBlur = 0
                        }
                        
                    })
                    Rectangle()
                        .frame(width: 40, height:10)
                        .foregroundColor(.clear)
                }
                    
            }

                
                
            
        }
        .navigationBarBackButtonHidden(true)
        
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
    
}


