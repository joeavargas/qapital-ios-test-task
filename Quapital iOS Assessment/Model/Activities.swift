//
//  Activities.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import Foundation

struct Activities: Codable, Identifiable {
    let id = UUID()
    let message: String
    let amount: Double
    let userId: Int
    let timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case id, message, amount, userId, timestamp
    }
}
