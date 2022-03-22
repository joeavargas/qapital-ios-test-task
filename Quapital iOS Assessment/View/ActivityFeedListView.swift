//
//  ActivityFeedListView.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/22/22.
//

import SwiftUI

struct ActivityFeedListView: View {
    
    var activities: [Activities]
    
    var body: some View {
        List(activities) { activity in
            ActivityFeedCardView(activities: activity)
                .listRowSeparator(.hidden)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ActivityFeedListView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFeedListView(activities: activityData)
    }
}
