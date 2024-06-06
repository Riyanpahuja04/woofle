//
//  toggleButton.swift
//  woofle
//
//  Created by James Handley on 6/6/2024.
//

import SwiftUI

struct ToggleButton: View {
    
    var labelName: String
    @Binding var selectedButtonState: [String: Bool]
    
    var body: some View {
        Text("+ \(labelName)")
            .font(.system(size: 17))
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding(.vertical, 8)
            .padding(.horizontal, 20)
            .background(userSelectionButtonColor(buttonKey: labelName))
            .cornerRadius(28)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.1)) {
                    selectedButtonState[labelName]?.toggle()
                }
            }
            .padding(.horizontal, 5)
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
    
    func userSelectionButtonColor(buttonKey: String) -> Color {
        
        if selectedButtonState[buttonKey] ?? false
        { return _selectedButtonColor }
        
        else
        { return _unselectedButtonColor }
        
    }
    
}

