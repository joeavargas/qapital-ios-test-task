//
//  NetworkManager.swift
//  Quapital iOS Assessment
//
//  Created by Joe Vargas on 3/20/22.
//

import Foundation

typealias OnApiSuccess = (Response) -> Void
typealias OnApiError = (Error) -> Void

class NetworkManager {
    static let shared = NetworkManager()
    
    let session = URLSession(configuration: .default)
    
    func fetchActivities(onSuccess: @escaping OnApiSuccess, onError: @escaping OnApiError) {
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
    //                print("DEBUG: response code: ", response)
                    print("DEBUG: \(error)")
                    onError(error)
                }
            }
            
            
        }
        task.resume()
    }
}
