//
//  User.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import Foundation

struct User: Codable, Equatable {
    var userId: Int
    var displayName: String
    var avatarUrl: String
    
    init(userId: Int, displayName: String, avatarUrl: String) {
        self.userId = userId
        self.displayName = displayName
        self.avatarUrl = avatarUrl
    }
}
