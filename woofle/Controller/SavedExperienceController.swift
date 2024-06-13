//
//  SavedExperienceController.swift
//  woofle
//
//  Created by James Handley on 13/6/2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import PhotosUI

class SavedExperienceController {
    
    var savedExperienceArray: [SavedExperience] = []
    
    func saveExperience(level: Int, photo: Data?, title: String, description: String?, mood: CGFloat) {
        savedExperienceArray.append(SavedExperience(image: photo , level: level - 1, title: title, description: description, mood: mood, date: Date()))
    }
    
}

class globalSavedExperience {
    static var shared = SavedExperienceController()
}
