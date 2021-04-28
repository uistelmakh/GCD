//
//  Post.swift
//  networking
//
//  Created by днс on 16.04.2021.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
