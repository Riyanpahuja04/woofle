//
//  Level.swift
//  woofle
//
//  Created by Riyan Pahuja on 11/6/2024.
//

import Foundation

struct Level: Codable {
    let level: Int
    let task: String
    let options: [Option]
}
