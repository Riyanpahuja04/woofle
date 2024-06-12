//
//  MapDots.swift
//  woofle
//
//  Created by James Handley on 7/6/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MapDots: View {
    
    @ObservedObject var dropdownViewModel: DropdownViewModel
    @State var woofleWalkFlag: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
    //@ObservedObject 
    
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
            
            if woofleWalkFlag {
                AnimatedImage(url: URL(string: "https://i.imgur.com/l6eKr1D.gif"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 240, height: 240)
                    .position(x:100, y: 155)
            }
            
            else {
                Image("woofle-standing")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .position(x:95, y: 130)
            }
            
            
            
        }.fixedSize()
            .onReceive(dropdownViewModel.$completionOverlayFlag.dropFirst(), perform: { _ in
                if !dropdownViewModel.completionOverlayFlag {
                    animateMovement()
                    woofleWalkFlag = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { 
                        withAnimation(.smooth(duration: 0.1)) {
                            woofleWalkFlag = false
                        }
                    }
                }
            })
        
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

