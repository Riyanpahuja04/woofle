//
//  activitySelectedScreen.swift
//  woofle
//
//  Created by James Handley on 6/6/2024.
//

import SwiftUI

struct activitySelectedScreen: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            MapView()
            LevelDropdownNoActivity()
            
        }
    }
}

#Preview {
    activitySelectedScreen()
}
