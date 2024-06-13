//
//  SavedExperience.swift
//  woofle
//
//  Created by James Handley on 13/6/2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import PhotosUI

struct SavedExperience: Identifiable {
    var id = UUID()
    var image: Data?
    var level: Int
    var title: String
    var description: String?
    var mood: CGFloat
    var date: Date
}
