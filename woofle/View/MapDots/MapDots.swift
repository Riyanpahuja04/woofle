//
//  MapDots.swift
//  woofle
//
//  Created by James Handley on 7/6/2024.
//

import SwiftUI

struct MapDots: View {
    
    // (X, Y, Size) for each given point in animation
    @State private var dotLocations: [(CGFloat, CGFloat, CGFloat, String)] = [
        
        // Invisible Animation Node
    (80, -5, 0, "token-mid"), // Visual Node
    (80, -5, 0, "token-mid"), // Intermediate Node
    
        // First Node
    (80, 0, 50, "token-mid"), // Visual Node
    (-45, 30, 55, "token-mid"), // Intermediate Node
    
        // Second Node
    (140, 50, 60, "token-mid"), // Visual Node
    (30, 75, 65, "token-mid"), // Intermediate Node
    
        // Third Node
    (-80, 100, 70, "token-mid"), // Visual Node
    (130, 120, 75, "token-mid"), // Intermediate Node
    
        // Final Node
    (-30, 170, 80, "Green-Token"), // Visual Node
    (-190, 220, 90, "Green-Token"), // Intermediate Node
    
        // Invisible Animation Node
    (-240, 220, 0, "Green-Token"), // Visual Node
    (-140, 220, 0, "token-mid"), // Intermediate Node
    ]
    
    @State private var pathIsExtended: Bool = true
    
    var body: some View {
        
        ZStack {
            
            Group {
                if pathIsExtended { Image("Path-Back")
                    .offset(x:-30,y:0) }
                else { Image("Path") }
            }
            
            
            Dot(dotLocations: $dotLocations[0])

            Dot(dotLocations: $dotLocations[2])
            
            Dot(dotLocations: $dotLocations[4])
            
            Dot(dotLocations: $dotLocations[6])
            
            Dot(dotLocations: $dotLocations[8])
            
            Dot(dotLocations: $dotLocations[10])
            
        }.fixedSize()
            .onTapGesture {
                animateMovement()
            }
        
    }
    
    // Calling this animation function will cause the animation to trigger
    func animateMovement() {
        withAnimation(.easeInOut(duration: 2)) {
            dotLocations.rotateLeft(positions: 1)
        }
        withAnimation(.easeInOut(duration: 2.00).delay(1.2)) {
            dotLocations.rotateLeft(positions: 1)
        }
    }
    
}

#Preview {
    MapDots()
}
