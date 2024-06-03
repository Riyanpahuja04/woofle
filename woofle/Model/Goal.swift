//
//  Goal.swift
//  woofle
//
//  Created by Riyan Pahuja on 3/6/2024.
//

import Foundation

class Goal: Codable {
    var id: UUID
    var statement: String
    var activities: [String]
}
