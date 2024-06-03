//
//  Activity.swift
//  woofle
//
//  Created by Riyan Pahuja on 3/6/2024.
//

import Foundation
import SwiftUI

class Activity: Codable {
    var id: UUID
    var shortDesc: String
    var detail: String
    var photoData: Data?
    
    var photo: UIImage? {
            get {
                guard let data = photoData else { return nil }
                return UIImage(data: data)
            }
            set {
                photoData = newValue?.jpegData(compressionQuality: 1.0)
            }
        }
}
