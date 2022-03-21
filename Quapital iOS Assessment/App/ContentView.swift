//
//  ContentView.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ActivityFeedViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.activities) { activity in
                HTMLRenderingView(html: activity.message)
            }
            .onAppear(perform: viewModel.fetchActivities)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
