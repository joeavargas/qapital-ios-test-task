//
//  Quapital_iOS_AssessmentApp.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import SwiftUI

@main
struct Quapital_iOS_AssessmentApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var viewModel = ActivityFeedViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: viewModel)
        }
    }
}
