//
//  MapDots.swift
//  woofle
//
//  Created by James Handley on 7/6/2024.
//

import SwiftUI

struct MapDots: View {
    
    // (X, Y, Size) for each given point in animation
    @State private var dotLocations: [(CGFloat, CGFloat, CGFloat)] = [
        
        // Invisible Animation Node
    (80, -5, 0), // Visual Node
    (80, -5, 0), // Intermediate Node
    
        // First Node
    (80, 0, 50), // Visual Node
    (-45, 30, 55), // Intermediate Node
    
        // Second Node
    (140, 50, 60), // Visual Node
    (30, 75, 65), // Intermediate Node
    
        // Third Node
    (-80, 100, 70), // Visual Node
    (130, 120, 75), // Intermediate Node
    
        // Final Node
    (-30, 170, 80), // Visual Node
    (0, 260, 90), // Intermediate Node
    
        // Invisible Animation Node
    (-30, 260, 0), // Visual Node
    (-30, 170, 0), // Intermediate Node
    ]
    
    var body: some View {
        
        ZStack {
            
            Image("Path")
            
            Dot(dotLocations: $dotLocations[0])

            Dot(dotLocations: $dotLocations[2])
            
            Dot(dotLocations: $dotLocations[4])
            
            Dot(dotLocations: $dotLocations[6])
            
            Dot(dotLocations: $dotLocations[8])
            
            Dot(dotLocations: $dotLocations[10])
            
        }.fixedSize()
        
    }
    
    // Calling this animation function will cause the animation to trigger
    func animateMovement() {
        withAnimation(.easeInOut(duration: 2.00)) {
            dotLocations.rotateLeft(positions: 1)
        }
        withAnimation(.easeInOut(duration: 2.00).delay(1.2)) {
            dotLocations.rotateLeft(positions: 1)
        }
    }
    
}

