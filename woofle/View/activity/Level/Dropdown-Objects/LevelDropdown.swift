//
//  LevelDropdown.swift
//  woofle
//
//  Created by James Handley on 6/6/2024.
//

import SwiftUI

struct LevelDropdown: View {
        
    @ObservedObject var dropdownViewModel: DropdownViewModel
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                Rectangle()
                    .foregroundColor(_defaultBackgroundColor)
                    .cornerRadius(20)
                    .frame(width: .infinity, height: 200)
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
                
                Text("Level: \(GlobalActivityTracker.shared.level)")
                    .foregroundColor(_dropdownImageColor)
                    .font(
                        .system(size: 20)
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(.top, -5)
                    .padding(.bottom, 10)
                
                Text(GlobalActivityTracker.shared.currentGoal)
                    .foregroundColor(_dropdownImageColor)
                    .font(
                        .system(size: 20)
                        .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Text(GlobalActivityTracker.shared.selectedOption?.brief ?? "Infinity")
                    .frame(width: .infinity, height: 40)
                    .font(
                        .system(size: 20)
                        .weight(.medium)
                    )
                    .padding(.horizontal, 60)
                    .background(_greenHeaderColor)
                    .cornerRadius(10)
                    .foregroundColor(_defaultBackgroundColor)
                
            }
            
            Image(systemName: "chevron.down")
                .font(.title)
                .padding(.horizontal, 30)
                .foregroundColor(_dropdownImageColor)
                .padding(.top, 200 + 20)
                .onTapGesture{
                    withAnimation(.interpolatingSpring) {
                        dropdownViewModel.currentMenu = 1
                    }
                }
            
        }.padding(.top, -40)
        ZStack {
            Circle()
                .frame(width: 80)
                .foregroundColor(_defaultBackgroundColor)
                .shadow(radius:2, x: 0, y: 4)
            Image(systemName: "note.text")
                .resizable()
                .frame(width:40, height:40)
                .foregroundColor(_dropdownImageColor)
                
        } .offset(x:130, y:40)
            
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
    // END TEMP COLORS
    
}

#Preview {
    LevelDropdown(dropdownViewModel: DropdownViewModel())
}
