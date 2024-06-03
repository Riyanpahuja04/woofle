//
//  User.swift
//  woofle
//
//  Created by Riyan Pahuja on 3/6/2024.
//

import Foundation

class User: Codable {
    var id: UUID
    var name: String
    var currGoal: String
    var pastGoals: [String?]
}
