//
//  activitySelectedScreen.swift
//  woofle
//
//  Created by James Handley on 6/6/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct activitySelectedScreen: View {
    
    @ObservedObject var dropdownViewModel = DropdownViewModel()
    @State private var storesView: AnyView?
    @State var backgroundBlur: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: returnAlignment()) {
            
            MapView(dropdownViewModel: dropdownViewModel).blur(radius: backgroundBlur)
            
            if dropdownViewModel.completionOverlayFlag {
                woofleCompletionScreen(backgroundBlur: $backgroundBlur, dropdownViewModel: dropdownViewModel)
            }
            
            else {
                VStack {
                    
                    Rectangle().ignoresSafeArea().frame(width: .infinity, height: 0).foregroundColor(_defaultBackgroundColor)
                    
                    switch dropdownViewModel.currentMenu {
                    case 0:
                        _levelDropdown
                    case 1:
                        _levelDropdownExpanded
                    case 2:
                        _levelDropdownNewActivity
                    case 3:
                        _levelDropdownNoActivity
                    default:
                        _levelDropdown
                    }
                    
                }
                
            }
        }
    }
    
    var _levelDropdown: some View {LevelDropdown(dropdownViewModel: dropdownViewModel)}
    var _levelDropdownExpanded: some View {LevelDropdownExpanded(dropdownViewModel: dropdownViewModel)}
    var _levelDropdownNewActivity: some View {LevelDropdownNewActivity(dropdownViewModel: dropdownViewModel)}
    var _levelDropdownNoActivity: some View {LevelDropdownNoActivity(dropdownViewModel: dropdownViewModel)}
    
    func returnAlignment() -> Alignment {
        if dropdownViewModel.completionOverlayFlag { return .center }
        else { return .top }
    }
    
    func returnBlur() -> CGFloat {
        if dropdownViewModel.completionOverlayFlag { 5 }
        else { 0 }
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
    
    
}

#Preview {
    activitySelectedScreen()
}
