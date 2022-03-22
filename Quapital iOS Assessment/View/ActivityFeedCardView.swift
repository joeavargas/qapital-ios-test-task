//
//  ActivityFeedCardView.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/21/22.
//

import SwiftUI

struct ActivityFeedCardView: View {
    var activities: Activities
    var body: some View {
        VStack {
            HStack {
                // MARK: - Avatar Image
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                // MARK: - VStack | Message and Date TextViews
                VStack(alignment: .leading) {
                    HTMLRenderingView(html: activities.message)
                        .scaledToFit()
                        .frame(height: 20)
                    Text(activities.timestamp)
                }
                .padding(.horizontal, 2)
                
                // MARK: - Amount TextViews
                Text("$2.00")
            }//: HStack
            .padding()
            
            Divider()
                .background(Color.gray)
                .padding(.horizontal)
        }
    }
}

struct ActivityFeedCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        let index: Int = 2
        
        ActivityFeedCardView(activities: activityData[index])
            .previewLayout(.sizeThatFits)
        ActivityFeedCardView(activities: activityData[index])
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
