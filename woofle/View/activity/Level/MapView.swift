//
//  MapView.swift
//  woofle
//
//  Created by Megan Nguyen on 5/6/2024.
//

import SwiftUI

struct MapView: View {
    
    @ObservedObject var dropdownViewModel: DropdownViewModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            // Background color
            Color(red: 1, green: 0.99, blue: 0.95)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .fill(Color(red: 0.43, green: 0.60, blue: 0.59))
                    .frame(height: 543)
            }
            .frame(maxWidth: .infinity)
            
            Image("scenery")
                .offset(y:316)
            Image("rocks")
                .offset(y:490)
            
            Rectangle().frame(width: .infinity, height: 60).foregroundColor(.backgroundGreen)
            
            MapDots(dropdownViewModel: dropdownViewModel).offset(y: 540)
            
        }.ignoresSafeArea()
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


#Preview {
    MapView(dropdownViewModel: DropdownViewModel())
}
