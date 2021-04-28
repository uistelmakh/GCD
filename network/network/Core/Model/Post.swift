//
//  Post.swift
//  network
//
//  Created by Sergey Stelmakh on 28.04.2021.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
