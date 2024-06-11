//
//  Dot.swift
//  woofle
//
//  Created by James Handley on 7/6/2024.
//

import SwiftUI

struct Dot: View {
    
    @Binding var dotLocations: (CGFloat, CGFloat, CGFloat, String)
    
    var body: some View {
        
        ZStack {
            
            Image("token-mid")
                .resizable()
                .scaledToFit()
                .position(x: dotLocations.0, y: dotLocations.1)
            
            if dotLocations.3 == "Green-Token" {
                
                
                
                Image("Green-Token")
                    .resizable()
                    .scaledToFit()
                    .position(x: dotLocations.0, y: dotLocations.1)
                    .transition(.offset(x: 160, y: -50).combined(with: .blurReplace))
            }
            
        }.frame(width: dotLocations.2)

        
    }
    
}

