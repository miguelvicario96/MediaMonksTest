//
//  Album.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import Foundation

public struct Album: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Albums = [Album]
