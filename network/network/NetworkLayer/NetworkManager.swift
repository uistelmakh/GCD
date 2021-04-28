//
//  NetworkManager.swift
//  network
//
//  Created by Sergey Stelmakh on 28.04.2021.
//

import Foundation

struct NetworkManager {
    
    enum HTTPMethod: String {
        case POST
        case PUT
        case GET
        case DELETE
    }
    
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    func getAllPosts(_ comlitionHandler: @escaping ([Post]) -> Void){
        
        if let url = URL(string: baseURL + "/posts") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error")
                } else {
                    if let response = response as? HTTPURLResponse,
                       let responseData = data{
                        let posts = try? JSONDecoder().decode([Post].self, from: responseData)
                        comlitionHandler(posts ?? [])
                    }
                }
                
            }.resume()
        }
    }
    
    func postCreatePost(_ post: Post, complitionHandler: () -> Void) {
        guard let url = URL(string: baseURL + "/posts") else { return }
        let request = MutableURLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
    }
}
