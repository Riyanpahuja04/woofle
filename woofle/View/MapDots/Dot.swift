//
//  Dot.swift
//  woofle
//
//  Created by James Handley on 7/6/2024.
//

import SwiftUI

struct Dot: View {
    
    @Binding var dotLocations: (CGFloat, CGFloat, CGFloat)
    
    var body: some View {
        
        Group {
                Image("token-mid")
                .resizable()
                .scaledToFit()
                .position(x: dotLocations.0, y: dotLocations.1)

            
        }.frame(width: dotLocations.2)

        
    }
    
}

