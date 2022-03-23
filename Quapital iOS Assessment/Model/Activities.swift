//
//  Activities.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import Foundation

struct Activities: Codable, Identifiable, Equatable {
    let id = UUID()
    let message: String
    let amount: Double
    let userId: Int
    let timestamp: String
    
    init(message: String, amount: Double, userId: Int, timestamp: String) {
        self.message = message
        self.amount = amount
        self.userId = userId
        self.timestamp = timestamp
    }
    
    enum CodingKeys: String, CodingKey {
        case id, message, amount, userId, timestamp
    }
    
    static func == (lhs: User, rhs: Activities) -> Bool {
            return lhs.userId == rhs.userId
        }
}
