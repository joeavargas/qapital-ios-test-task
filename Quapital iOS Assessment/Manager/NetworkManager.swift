//
//  NetworkManager.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import Foundation

typealias OnApiResponseSuccess = (Response) -> Void
typealias OnApiUserSuccess = (User) -> Void
typealias OnApiError = (Error) -> Void

class NetworkManager {
    static let shared = NetworkManager()
    
    let session = URLSession(configuration: .default)
    
    func fetchActivities(onSuccess: @escaping OnApiResponseSuccess, onError: @escaping OnApiError) {
        let BASE_URL = "https://qapital-ios-testtask.herokuapp.com/activities?from=2021-01-01T00:00:00+00:00&to=2022-01-01T00:00:00+00:00"
        let url = URL(string: BASE_URL)
        
        let task = session.dataTask(with: url!) { data, response, error in
            DispatchQueue.main.async {
                
                // Handle session error
                if let error = error {
                    print(error)
                    return
                }
                
                // Ensure there is data and a server response
                guard let data = data, let response = response as? HTTPURLResponse else {
                    print("DEBUG: Invalid data or response")
                    return
                }
                
                // Handle server response code
                do{
                    switch response.statusCode {
                    case 200:
                        // parse successful result
                        let activities = try JSONDecoder().decode(Response.self, from: data)
                        onSuccess(activities)
                        
                    default:
                        // handle unsuccessful error(400s)
                        onError(error!)
                    }
                } catch {
                    print("DEBUG: \(error)")
                    onError(error)
                }
            }
        }
        task.resume()
    }
    
    func fetchUserBy(_ id: Int, onSuccess: @escaping OnApiUserSuccess, onError: @escaping OnApiError) -> Void {
        let BASE_URL = "https://qapital-ios-testtask.herokuapp.com/users/\(id)"
        let url = URL(string: BASE_URL)
        
        let task = session .dataTask(with: url!) { data, response, error in
            DispatchQueue.main.async {
                
                // Handle session error
                if let error = error {
                    print("DEBUG: Session error \(error)")
                    return
                }
                
                // Ensure there is data and a server response
                guard let data = data, let response = response as? HTTPURLResponse else {
                    print("DEBUG: Invalid data or response")
                    return
                }
                
                // Handle response
                do {
                    switch response.statusCode {
                    case 200:
                        // parse successful result
                        let users = try JSONDecoder().decode(User.self, from: data)
                        onSuccess(users)
                        
                    default:
                        // handle unsuccessful error(400s)
                        onError(error!)
                    }
                } catch {
                    print("DEBUG: \(error)")
                    onError(error)
                }
            }
        }
        task.resume()
    }
}
