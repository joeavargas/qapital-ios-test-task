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
        VStack(spacing: 15) {
            HStack {
                // MARK: - Avatar Image
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                // MARK: - VStack | Message and Date TextViews
                VStack(alignment: .leading) {
                    Text(activities.message)
                        .lineLimit(nil)
                        .font(.system(size: 12))
                    Text(activities.timestamp)
                        .fontWeight(.medium)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 2)
                Spacer()
                // MARK: - Amount TextViews
                Text("\(activities.amount, specifier: "$%.2f")")
            }//: HStack
            .padding()
            
            Divider()
                .background(Color.gray)
                .padding(.horizontal)
        }
    }
    func returnAvatarImageString(activity: Activities, user: User) -> String {
        var avatarUrlString = ""
        if activity.userId == user.userId {
            avatarUrlString = "http://qapital-ios-testtask.herokuapp.com/avatars/\(user.displayName.lowercased()).jpg"
        }
         return avatarUrlString
    }
}

struct ActivityFeedCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        let index: Int = 0
        
        ActivityFeedCardView(activities: activityData[index])
            .previewLayout(.sizeThatFits)
        ActivityFeedCardView(activities: activityData[index])
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
