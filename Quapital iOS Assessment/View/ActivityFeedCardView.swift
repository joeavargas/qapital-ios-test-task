//
//  ActivityFeedCardView.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/21/22.
//

import SwiftUI
import Kingfisher

struct ActivityFeedCardView: View {
    @ObservedObject var viewModel = ActivityFeedViewModel()
    var activities: Activities?
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                // MARK: - Avatar Image
                    let url = viewModel.returnAvatarImageString(id: activities!.userId)
                    KFImage(URL(string: url))
                    .resizable()
                    .frame(width: 50, height: 50)
                        
                Spacer()
                // MARK: - VStack | Message and Date TextViews
                VStack(alignment: .leading) {
                    if activities != nil {
                        Text(activities!.message)
                            .lineLimit(nil)
                            .font(.system(size: 12))
                        Text(activities!.timestamp)
                            .fontWeight(.medium)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 2)
                Spacer()
                // MARK: - Amount TextViews
                if activities != nil {
                    Text("\(activities!.amount, specifier: "$%.2f")")
                }
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
        let index: Int = 0
        
        ActivityFeedCardView(activities: activityData[index])
            .previewLayout(.sizeThatFits)
        ActivityFeedCardView(activities: activityData[index])
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
