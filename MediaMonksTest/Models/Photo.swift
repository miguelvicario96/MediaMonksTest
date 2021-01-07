//
//  Photo.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import Foundation

public struct Photo: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

public typealias Photos = [Photo]
