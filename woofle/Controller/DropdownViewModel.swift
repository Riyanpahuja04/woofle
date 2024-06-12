//
//  DropdownViewModel.swift
//  woofle
//
//  Created by James Handley on 11/6/2024.
//

import Foundation
import SwiftUI

class DropdownViewModel: ObservableObject {
    
    @Published var completionOverlayFlag: Bool = true
    
    //TODO: Retrieve data from storage
    @Published var currentLevel: String = "LEVEL 0"
    @Published var levelName: String = "Playing “Stand By Me” Using Basic Chords On Guitar"
    @Published var goal: String = "Learn Basic Chords"
    @Published var description: String = "The four most common guitar chords are E-Minor, C, G and D. Youtube Tutorials would be a good place to start!"
    
    //TODO: Retrieve current menu from Storage
    @Published var currentMenu: Int = 0
    
    
}
