//
//  ActivityFeedViewModel.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import Foundation

final class ActivityFeedViewModel: ObservableObject {
    @Published var activities = [Activities]()

    
    func fetchActivities() {
        NetworkManager.shared.fetchActivities { response in
            self.activities.append(contentsOf: response.activities)
        } onError: { error in
            print("DEBUG: \(error)")
        }

    }
    
    func returnAvatarImageString(id: Int) -> String{
        var avatarUrlString: String = ""
        NetworkManager.shared.fetchUserBy(id) { displayName in
           avatarUrlString = "http://qapital-ios-testtask.herokuapp.com/avatars/\(displayName.lowercased()).jpg"
        } onError: { error in
            print("DEBUG: \(error)")
        }
        return avatarUrlString
    }
}
