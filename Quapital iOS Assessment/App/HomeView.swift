//
//  HomeView.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/23/22.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = ActivityFeedViewModel()
    var body: some View {
        ActivityFeedListView(activities: viewModel.activities)
            .onAppear(perform: viewModel.fetchActivities)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
