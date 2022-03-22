//
//  Quapital_iOS_AssessmentApp.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import SwiftUI

@main
struct Quapital_iOS_AssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            ActivityFeedCardView(activities: activityData.first!)
        }
    }
}
